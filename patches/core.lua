
local function receiver3(msg)
var = "to_pv"
  local chat_id = tostring(msg.chat_id_)
  if chat_id:match('^-100') then
     var = "to_sgp"
  elseif chat_id:match('^-') then
     var = "to_gp"
  end
  return var
end

local function is_super(data)
var = false
  local chat_id = tostring(data.message_.chat_id_)
  if chat_id:match('^-100') then
     var = true
  end
  return var
end

local function is_group(msg)
local chat_id = msg.chat_id_
if chat_id:match("^(-100)") then
    var = false
    if data2[tostring(chat_id:gsub("-100",""))] then
       var = true
    end
return var
end
end

function out(receiver, time)
 var = false
    local out = redis:sismember('expires'..bot_divest..receiver, "t"..time)
	if out then
	   var = true
	end
    return var 
end

function out2(user_id, time)
 var = false
    local out = redis:sismember('adminsexpire'..bot_divest..user_id, "t"..time)
	if out then
	   var = true
	end
    return var 
end

local function users_info(arg, data)
cmd = arg.cmd
--vardump(data)
local user_id = data.id_
local chat_id = arg.chat_id
local msg_reply = arg.msg_reply
uname = ""
name = data.first_name_
if data.last_name_ then
   name = data.first_name_.." "..data.last_name_
end
uname = name
if data.username_ then
   uname = "@"..data.username_
end
if cmd == "config" then
   data2[tostring(chat_id:gsub("-100", ""))]["moderators"][tostring(user_id)] = uname
   return save_data(data2)
end
if cmd == "spam" then
   if redis:get("muteall:"..chat_id) then
      text = "کاربر "..uname.." به دلیل ارسال پیام های مکرر بیش از |"..arg.num.."| بار در زمان #تعطیلی گروه از گروه ریمو شد"
   else
      text = "کاربر "..uname.." به دلیل ارسال پیام های مکرر بیش از |"..arg.num.."| بار از گروه ریمو شد"
   end
   return sendmsg(chat_id, 0, text)
end
if cmd == "inpv" then
   local text = "سلام "..name.."\n"..arg.text
   return sendmsg(chat_id, msg_reply, text)
end
if cmd == "expireadmins" then
   local text = "ادمینی ایشان به اتمام رسید "..user_id.." "..uname
   sendmsg(148617896, 0, text)
   return sendsudo(text)
end
if cmd == "wlc" then
   function get_wlc(arg, data)
	local title = data.title_
    local user_id = arg.user_id
    local chat_id = arg.chat_id
    local name = arg.name
   if redis:hget("rank:variables", user_id) then
      name = redis:hget("rank:variables", user_id)
   end
   if arg.usernames then
      username = " @"..arg.usernames
   else
      username = ""
   end
   local about = ""
   local rules = ""
   if data2[tostring(chat_id:gsub("-100",""))]["description"] then
      about = data2[tostring(chat_id:gsub("-100",""))]["description"]
      about = "\n<code>توضیحات</code> :\n"..about.."\n"
   end
   if data2[tostring(chat_id:gsub("-100",""))]["rules"] then
      rules = data2[tostring(chat_id:gsub("-100",""))]["rules"]
      rules = "\n<code>قوانین </code>:\n"..rules.."\n"
   end
   local group_wlc = arg.wlctext
   group_wlc = string.gsub(group_wlc, "$name", name)
   group_wlc = string.gsub(group_wlc, "$gname", title)
   group_wlc = string.gsub(group_wlc, "$uname", username)
   group_wlc = string.gsub(group_wlc, "$rules", rules)
   group_wlc = string.gsub(group_wlc, "$about", about)
   return sendmsg2(chat_id, msg_reply, group_wlc, "off")
 end
 usernames = ""
   if data.username_ then
      usernames = "@"..data.username_
   end
   tdcli_function({ ID = "GetChat", chat_id_ = chat_id }, get_wlc, {chat_id = chat_id, msg_reply = msg_reply, wlctext = arg.wlctext , usernames = usernames, name = data.first_name_, user_id = user_id})
end
if cmd == "wlc2" then
   function get_wlc(arg, data)
    local title = data.title_
    local user_id = arg.user_id
    local chat_id = arg.chat_id
    local name = arg.uname
   if redis:hget("rank:variables", user_id) then
      name = redis:hget("rank:variables", user_id)
   end
   if not name:match("^@") then
      name = "<i>"..name.."</i>"
   end
   local about = ""
   local rules = ""
   if data2[tostring(chat_id:gsub("-100",""))]["description"] then
      about = data2[tostring(chat_id:gsub("-100",""))]["description"]
      about = "\n<code>توضیحات</code> :\n"..about.."\n"
   end
   if data2[tostring(chat_id:gsub("-100",""))]["rules"] then
      rules = data2[tostring(chat_id:gsub("-100",""))]["rules"]
      rules = "\n<code>قوانین</code> :\n"..rules.."\n"
   end
   local text = "سلام "..name.." ورود شما را به <i>"..title.."</i> خوش آمد عرض میکنیم\n"..about..rules
   return sendmsg(chat_id, msg_reply, text, "off")
end

   tdcli_function({ ID = "GetChat", chat_id_ = chat_id }, get_wlc, {chat_id = chat_id, msg_reply = msg_reply , uname = uname, user_id = user_id})
end
  
end

function expires_chack(msg)
        local chat_id = msg.chat_id_
        local chat_id2 = chat_id:gsub("-100","")
        local hashs = 'expires'..bot_divest..chat_id2
	    local expiretime = redis:hget('expiretime'..bot_divest, chat_id2)
		if not expiretime then
           return false
        end
		local group_owner = ""
		local group_owner = data2[tostring(chat_id2)]["set_owner"]
		if not group_owner then
		   group_owner = ""
		end
	    local now = tonumber(os.time())
	    if expiretime then
		   local timetoexpire = (math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1)
		   if tonumber("0") > tonumber(timetoexpire) then
		      redis:sadd("endexpiresgroups", chat_id)
              redis:del('expires'..bot_divest..chat_id2)
	          local hashaa = "chat:"..chat_id2..":badword"
              redis:del(hashaa, "1")
	          redis:del("Groupcm"..bot_divest..":"..chat_id2, true)
	          redis:del("mwarn"..bot_divest..":"..chat_id2, true)
			  redis:hget('expiretime'..bot_divest, chat_id2)
			  --print(redis:get("setexpire"..bot_divest..chat_id))
			  local text = "تاریخ انقضای این گروه به اتمام رسید\nبرای شارژ یا تمدید بر روی این متن کلیک کنید و با سازنده صحبت کنید"
			  sendmen(chat_id, 0, text)
			  leave_chat(chat_id)
			  if redis:get("setexpire"..bot_divest..chat_id) then
			     sendmsg(redis:get("setexpire"..bot_divest..chat_id), 0, "گروه "..chat_id.." تاریخش تمام شد ")
                 sendmsg(sudo_id, 0, "شارژ گروه "..chat_id.." تمام شد\n\n"..redis:get("setexpire"..bot_divest..chat_id))
			  else
			     sendmsg(sudo_id, 0, "شارژ گروه "..chat_id.." تمام شد\n\n")
			  end
			  data2[tostring("groups")][tostring(chat_id:gsub("-100", ""))] = nil
			  data2[tostring(chat_id:gsub("-100",""))] = nil
              save_data(data2)
			  redis:hdel('expiretime'..bot_divest, chat_id2)
			  redis:hdel("setexpire"..bot_divest..chat_id2, "expires")
			  return redis:srem("expiregroup"..bot_divest, chat_id2)
	       end
	   if tonumber(timetoexpire) == 0 then
		  if out(chat_id2, "0") then return false end
		  local text = "امروز اخرین مهلت برای تمدید گروه است\nدر صورت عدم تمدید ربات گروه را ترک خواهد کرد\n\nبرای تمدید روی این متن کلیک کنید و با سازنده صحبت کنید"
		  sendmsg(chat_id, 0, text)
		  redis:sadd(hashs, "t".."0")
	   end
	   if tonumber(timetoexpire) == 1 then
		  if out(chat_id2, "1") then return false end
		  local text = '1 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.'
		  sendmsg(chat_id, 0, text)
		  redis:sadd(hashs, "t".."1")
	   end
	   if tonumber(timetoexpire) == 2 then
		  if out(chat_id2, "2") then return false end
		  local text = '2 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.'
		  sendmsg(chat_id, 0, text)
		  redis:sadd(hashs, "t".."2")
	   end
	   if tonumber(timetoexpire) == 3 then
		  if out(chat_id2, "3") then return false end
		     local text = '3 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.'
             sendmsg(chat_id, 0, text)
		     redis:sadd(hashs, "t".."3")
	      end
	   if tonumber(timetoexpire) == 10 then
		  if out(chat_id2, "10") then return false end
		     local text = '10 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.'
             sendmsg(chat_id, 0, text)
		     redis:sadd(hashs, "t".."10")
	      end
	   if tonumber(timetoexpire) == 20 then
		  if out(chat_id2, "20") then return false end
		     local text = '20 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.'
             sendmsg(chat_id, 0, text)
		     redis:sadd(hashs, "t".."20")
	      end
      end
end

function enable_channel(chat_id)
	if not config.disabled_channels then
		config.disabled_channels = {}
	end	
	if config.disabled_channels[chat_id] == nil or config.disabled_channels[chat_id] == false then
	   return sendmsg(chat_id, 0, "ربات در این گروه فعال است")
	end
	config.disabled_channels[chat_id] = false
	save_config()
    return sendmsg(chat_id, 0, "ربات در این گروه فعال گردید")
end

function disable_channel(chat_id)
	if not config.disabled_channels then
		config.disabled_channels = {}
	end
	if config.disabled_channels[chat_id] == true then
	   return sendmsg(chat_id, 0, "ربات در این گروه غیرفعال است")
	end
	config.disabled_channels[chat_id] = true
	save_config()
	return sendmsg(chat_id, 0, "ربات در این گروه غیرفعال گردید")
end

function is_pattern(msg)
local chat_id = msg.chat_id_
var = false
--[[local chash = "cmuser2"..bot_divest..":"..chat_id
if redis:get(chash) then
   return false
end]]
   for name, plugin in pairs(plugins) do
       for k,pattern in pairs(plugin.patterns) do
           if msg and msg.text then
              matches = { string.match(msg.text:lower(), pattern) }
           end
            if next(matches) then
	          var = true
	       end
	    end
	end
	--redis:setex(chash, 10, true)
return var
end

function captions(msg)
       local chat_id = msg.chat_id_ 
	   local settings = data2[tostring(chat_id:gsub("-100", ""))]["settings"]
       local names = redis:hkeys("chat:"..chat_id:gsub("-100","")..":badword")
             for i=1, #names do
                if string.match(msg.content_.caption_:lower(), names[i]) then --6
                   delmsg(chat_id, {[0] = msg.id_})
                end
             end
			 local text = msg.content_.caption_:lower()
			 local is_link_msg = (text:match('(t.me/%S+)') or text:match('(telegram.me/%S+)') or text:match('(tlgrm.me/%S+)') or text:match('(telegram.dog/%S+)') )
	         if is_link_msg and settings.lock_link == "yes" then
                delmsg(chat_id, {[0] = msg.id_})
             end
			 if (text:match("([@#][%a%d])")) and settings.lock_tag == "yes" then
                delmsg(chat_id, {[0] = msg.id_})
             end
end

function captions2(msg, Text)
       local chat_id = msg.chat_id_ 
	   local settings = data2[tostring(chat_id:gsub("-100", ""))]["settings"]
       local names = redis:hkeys("chat:"..chat_id:gsub("-100","")..":badword")
             for i=1, #names do
                if string.match(Text, names[i]) then --6
                   delmsg(chat_id, {[0] = msg.id_})
                end
             end
			 local text = Text:lower()
			 local is_link_msg = (text:match('(t.me/%S+)') or text:match('(telegram.me/%S+)') or text:match('(tlgrm.me/%S+)') or text:match('(telegram.dog/%S+)') )
	         if is_link_msg and settings.lock_link == "yes" then
                delmsg(chat_id, {[0] = msg.id_})
             end
			 if (Text:match("([@#][%a%d])")) and settings.lock_tag == "yes" then
                delmsg(chat_id, {[0] = msg.id_})
             end
end

function procces_msg(msg, edited)
local chat_id = msg.chat_id_
local settings = data2[tostring(chat_id:gsub("-100", ""))]["settings"]

if edited and settings.lock_edite == "yes" then
   delmsg(chat_id, {[0] = msg.id_})
end

if msg.forward_info_ and settings.lock_fwd == "yes" then
   delmsg(chat_id, {[0] = msg.id_})
elseif msg.reply_to_message_id_ ~= 0 and settings.lock_reply == "yes" then
   delmsg(chat_id, {[0] = msg.id_})
end

if msg.content_.text_ then
   local text = msg.content_.text_
   if settings.lock_text == "yes" then
      delmsg(chat_id, {[0] = msg.id_})
   end
   local names = redis:hkeys("chat:"..chat_id:gsub("-100","")..":badword")
   for i=1, #names do
	   if string.match(text:lower(), names[i]) then
          delmsg(chat_id, {[0] = msg.id_})
       end
   end
      if (text:match("([@#][%a%d])")) and settings.lock_tag == "yes" then
         delmsg(chat_id, {[0] = msg.id_})
      end
	  local is_link_msg = (text:match('(t.me/%S+)') or text:match('(telegram.me/%S+)') or text:match('(tlgrm.me/%S+)') or text:match('(telegram.dog/%S+)') )
	  if is_link_msg and settings.lock_link == "yes" then
         delmsg(chat_id, {[0] = msg.id_})
      end
	  local is_fars_msg = text:match("[\216-\219][\128-\191]")
      if data2[tostring(chat_id:gsub("-100", ""))]["settings"]["lock_numspam"] then
         NUM_LEN_MAX = tonumber(data2[tostring(chat_id:gsub("-100", ""))]["settings"]["lock_numspam"])
      end
      if settings.lock_spam == "yes" and is_fars_msg and string.len(text) > 6000 then
         delmsg(chat_id, {[0] = msg.id_})
      elseif settings.lock_spam == "yes" and text:match("[a-zA-Z]") and string.len(text) > 4000 then
         delmsg(chat_id, {[0] = msg.id_})
      end  
      if settings.lock_spam == "yes" and data2[tostring(chat_id:gsub("-100", ""))]["settings"]["lock_numspam"] and is_fars_msg and string.len(text) > NUM_LEN_MAX then
	     delmsg(chat_id, {[0] = msg.id_})
      elseif settings.lock_spam == "yes" and data2[tostring(chat_id:gsub("-100", ""))]["settings"]["lock_numspam"] and msg.text:match("[a-zA-Z]") and string.len(text) > NUM_LEN_MAX then
         delmsg(chat_id, {[0] = msg.id_})
      end
	  if is_fars_msg and settings.lock_arabic == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  local is_en_msg = text:match("[a-zA-Z]")
      if is_en_msg and settings.lock_en == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
end
local MSG_ID = msg.content_.ID
----------------------#medias
if MSG_ID == "MessageAudio" then
      if settings.lock_media == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  if settings.lock_audio == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
      if msg.content_.caption_ then
         captions(msg)
      end
end
if MSG_ID == "MessagePhoto" then
   if settings.lock_media == "yes" then
	  delmsg(chat_id, {[0] = msg.id_})
   end
   if settings.lock_photo == "yes" then
	  delmsg(chat_id, {[0] = msg.id_})
  end
  if msg.content_.caption_ then
     captions(msg)
  end
elseif MSG_ID == "MessageVideo" then
      if settings.lock_media == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  if settings.lock_video == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
      if msg.content_.caption_ then
         captions(msg)
      end
elseif MSG_ID == "MessageAnimation" then
      if settings.lock_media == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  if settings.lock_gif == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  if msg.content_.caption_ then
         captions(msg)
      end
elseif MSG_ID == "MessageVoice" then
      if settings.lock_media == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  if settings.lock_voice == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  if msg.content_.caption_ then
         captions(msg)
      end
elseif MSG_ID == "MessageSticker" then
      if settings.lock_media == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  if settings.lock_sticker == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
elseif MSG_ID == "MessageContact" then
      if settings.lock_media == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  if settings.lock_contact == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
elseif MSG_ID == "MessageDocument" then
      if settings.lock_media == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  if settings.lock_document == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  if msg.content_.caption_ then
         captions(msg)
      end
	  if msg.content_.document_ then
	     captions2(msg, msg.content_.document_.file_name_)
	  end
elseif MSG_ID == "MessageLocation" then
      if settings.lock_media == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  if settings.lock_location == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  if msg.content_.caption_ then
         captions(msg)
      end
elseif MSG_ID == "MessageGame" then
      if settings.lock_media == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  if settings.lock_game == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
elseif msg.via_bot_user_id_ ~= 0 then
      if settings.lock_media == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
	  if settings.lock_unsup == "yes" then
	     delmsg(chat_id, {[0] = msg.id_})
      end
elseif MSG_ID == "MessageText" and settings.lock_link == "yes" then
   local tt = msg.content_.entities_
         if msg.content_.web_page_ and settings.lock_web == "yes" then
	        delmsg(chat_id, {[0] = msg.id_})
         end
		 if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" and settings.lock_web == "yes" then
	        delmsg(chat_id, {[0] = msg.id_})
         end
   for i=0, #tt do
      if msg.content_.entities_[i] and msg.content_.entities_[i].url_ then
	     local text = (tt[i].url_)
	     local is_link_msg = (text:match('(t.me/%S+)') or text:match('(telegram.me/%S+)') or text:match('(tlgrm.me/%S+)') or text:match('(telegram.dog/%S+)') )
	     if is_link_msg ~= nil and is_link_msg then
            delmsg(chat_id, {[0] = msg.id_})
         end
	  end
    end


   end
   return msg
end

function antispam(msg)
  local chat_id = msg.chat_id_
  local user_id = msg.sender_user_id_
  local TIME_CHECK = 2
  local NUM_MSG_MAX = 5
  local hash = "user"..bot_divest..":"..user_id..":msgs"
  local msgs = tonumber(redis:get(hash) or 0)
if data2[tostring(chat_id:gsub("-100", ""))]["settings"]["lock_flood"] == "no" then
   return false
end
   if data2[tostring(chat_id:gsub("-100", ""))]["settings"]["flood_time_max"] then
      TIME_CHECK = tonumber(data2[tostring(chat_id:gsub("-100", ""))]["settings"]["flood_time_max"])
   end
   if data2[tostring(chat_id:gsub("-100", ""))]["settings"]["flood_msg_max"] then
      NUM_MSG_MAX = tonumber(data2[tostring(chat_id:gsub("-100", ""))]["settings"]["flood_msg_max"])
   end
   if msgs >= NUM_MSG_MAX then
      delmsg(chat_id, {[0] = msg.id_})
      if not redis:get("userkicked"..bot_divest..":"..user_id..":"..chat_id) then
	     kick(chat_id, user_id)
		 getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "spam", msg_reply = 0, num = NUM_MSG_MAX})
	     redis:setex("userkicked"..bot_divest..":"..user_id..":"..chat_id, 15, true)
      end
      return false
   end
   redis:setex(hash, TIME_CHECK, msgs + 1)
end

function multi(msg)
local chat_id = msg.chat_id_
   if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") and data2[tostring(chat_id:gsub("-100", ""))]["settings"]["set_link"] == "waiting" and is_momod(msg) then
	  data2[tostring(chat_id:gsub("-100", ""))]["settings"]["set_link"] = string.match(msg.content_.text_, "(https://telegram.me/joinchat/%S+)")
	  save_data(data2)
	  return sendmsg(chat_id, msg.id_, "بسیار خب لینک ثبت شد")
   end
   if msg.content_.text_:match("(https://t.me/joinchat/%S+)") and data2[tostring(chat_id:gsub("-100", ""))]["settings"]["set_link"] == "waiting" and is_momod(msg) then
	  data2[tostring(chat_id:gsub("-100", ""))]["settings"]["set_link"] = string.match(msg.content_.text_, "(https://t.me/joinchat/%S+)")
	  save_data(data2)
	  return sendmsg(chat_id, msg.id_, "بسیار خب لینک ثبت شد")
   end
end

function welcoming(msg)
local chat_id = msg.chat_id_ 
local tt = msg.content_.members_
local wlctext = data2[tostring(chat_id:gsub("-100",""))]["group_wlc"]
   if msg.content_.ID == "MessageChatAddMembers" then
	   for i=0, #tt do
		   if data2[tostring(chat_id:gsub("-100",""))]["settings"]["lock_bot"] == "yes" then
		      if tt[i].username_ and string.sub(tt[i].username_:lower(), -3) == "bot" and not is_momod2(chat_id, tt[i].id_) then
			     return kick(chat_id, tt[i].id_)
			  end
		   end
		   if is_banned(chat_id, tt[i].id_) and not is_momod2(chat_id, tt[i].id_) then
	          return kick(chat_id, tt[i].id_)
	       end
         end
      if data2[tostring(chat_id:gsub("-100",""))]["settings"]["wlc"] == "on" then
	     if wlctext then
		    return getuser(msg.content_.members_[0].id_, users_info, {chat_id = chat_id, cmd = "wlc", msg_reply = msg.id_, wlctext = wlctext})
		 elseif wlctext == nil then
		    return getuser(msg.content_.members_[0].id_, users_info, {chat_id = chat_id, cmd = "wlc2", msg_reply = msg.id_})
	     end
	  end
   elseif msg.content_.ID == "MessageChatJoinByLink" then
      if is_banned(chat_id, msg.sender_user_id_) and not is_momod2(chat_id, msg.sender_user_id_) then
	     return kick(chat_id, msg.sender_user_id_)
	  end
      if data2[tostring(chat_id:gsub("-100",""))]["settings"]["wlc"] == "on" then
	     if wlctext then
		    return getuser(msg.sender_user_id_, users_info, {chat_id = chat_id, cmd = "wlc", msg_reply = msg.id_, wlctext = wlctext})
		 elseif wlctext == nil then
		    return getuser(msg.sender_user_id_, users_info, {chat_id = chat_id, cmd = "wlc2", msg_reply = msg.id_})
	     end
      end
   end
end

function redises(msg)
local chat_id = msg.chat_id_
redis:sadd('supergroups:', chat_id:gsub("-100",""))
redis:sadd('channel:'..bot_divest..chat_id:gsub("-100","")..':users', msg.sender_user_id_)
redis:incr('msgs:'..bot_divest..msg.sender_user_id_..':'..chat_id:gsub("-100",""))
end

function expires_admins(msg)
local user_id = msg.sender_user_id_
local chat_id = msg.chat_id_
local hashs = 'adminsexpire'..bot_divest..user_id
local expiretime = redis:hget('expireadmin'..bot_divest, user_id)
	    if not expiretime then
           return false
        end
	    local now = tonumber(os.time())
	    if expiretime then
		   local timetoexpire = (math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1)
		   if tonumber("0") > tonumber(timetoexpire) then
		      sendmen(sudo_id, 0, "مدت ادمینی شما به اتمام رسیده است بر روی این متن کلیک کنید و تمدید نمایید", user_id)
			  sendmen(chat_id, msg.id_, "مدت ادمینی شما به اتمام رسیده است بر روی این متن کلیک کنید و تمدید نمایید")
			  remcontact({[0] = tonumber(user_id)})
			  data2[tostring("admins")][tostring(user_id)] = nil
	          save_data(data2)
			  redis:hdel('expireadmin'..bot_divest, user_id)
			  getuser(user_id, users_info, {chat_id = tostring(148617896), cmd = "expireadmins", msg_reply = 0, chats = chat_id})
		   end
	   if tonumber(timetoexpire) == 0 then
	   if out2(user_id, "0") then return false end
		  local text = "اخرین روز برای تمدید ادمینی ربات\nدرصورت عدم تمدید شماره شما حذف میشود"
		  sendmen(sudo_id, 0, "اخرین روز برای تمدید ادمینی ربات\nدرصورت عدم تمدید شماره شما حذف میشود", user_id)
		  sendmsg(chat_id, 0, text)
		  redis:sadd(hashs, "t".."0")
	   end
	   if tonumber(timetoexpire) == 1 then
	   if out2(user_id, "1") then return false end
		  local text = '1 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.'
		  sendmen(sudo_id, 0, '1 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.', user_id)
		  sendmsg(chat_id, 0, text)
		  redis:sadd(hashs, "t".."1")
	   end
	   if tonumber(timetoexpire) == 2 then
	   if out2(user_id, "2") then return false end
		  local text = '2 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.'
		  sendmsg(chat_id, 0, text)
		  redis:sadd(hashs, "t".."2")
	   end
	   if tonumber(timetoexpire) == 3 then
	   if out2(user_id, "3") then return false end
		  local text = '3 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.'
          sendmsg(chat_id, 0, text)
		  redis:sadd(hashs, "t".."3")
	   end
	   if tonumber(timetoexpire) == 10 then
	   if out2(user_id, "10") then return false end
		  local text = '10 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.'
          sendmsg(chat_id, 0, text)
		  redis:sadd(hashs, "t".."10")
	   end
	   if tonumber(timetoexpire) == 10 then
	   if out2(user_id, "10") then return false end
		  local text = '10 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.'
          sendmsg(chat_id, 0, text)
		  redis:sadd(hashs, "t".."10")
	   end

   end
end

function tegra(msg, chat_id)
      expires_chack(msg)
	  redises(msg)
	  local text_in = msg.content_.text_
      if text_in and text_in:lower() == "bot on" and is_owner(msg) then
         return enable_channel(chat_id)
      elseif text_in and text_in:lower() == "bot off" and is_owner(msg) then
         return disable_channel(chat_id)
      end
      if is_channel_disabled(chat_id) then
         --[[if is_momod(msg) and is_pattern(msg) then
            return sendmsg(chat_id, msg.id_, "لیدر عزیز ربات غیرفعال است\nمیتوانید با <b>Bot On</b> فعال کنید")
	     end]]
	     return false
      end
	  if not msg.can_be_deleted_ then
	     local no_admin = tonumber(redis:get("noadmin"..bot_divest..chat_id) or 0 )
	     if no_admin > 70 then
		    local text = 'ربات باید ادمین گروه باشد در غیر اینصورت گروه را ترک میکند'
            sendmsg(chat_id, 0, text)
			redis:del("noadmin"..bot_divest..chat_id)
		    --return leave_chat(chat_id)
			return false
	     end
	     redis:incr("noadmin"..bot_divest..chat_id)
	  end
      if not is_momod(msg) and not is_protect(msg) and msg.can_be_deleted_ then
		 if redis:get("muteall:"..chat_id) then
            delmsg(chat_id, {[0] = msg.id_})
         end
		 if is_muted_user(msg) then
		    return delmsg(chat_id, {[0] = msg.id_})
         end
		 if is_banned(chat_id, msg.sender_user_id_) then
		    delmsg(chat_id, {[0] = msg.id_})
	        return kick(chat_id, msg.sender_user_id_)
	     end
	  end
	  
end

function process(data)
--vardump(data)
local msg = data.message_
if receiver3(msg) == "to_pv" then
   if not redis:get("pvlimite"..bot_divest..":"..data.message_.sender_user_id_) then
	   if is_admin(msg) and not is_sudo(msg) then
	      return data
	   end
	   redis:sadd("pvusers", msg.chat_id_)
	   redis:setex("pvlimite"..bot_divest..":"..data.message_.sender_user_id_, 43200, true)
	   local text = (redis:get("price") or "من یکی از رباتهای یوبی هستم\n\nمیتونی منو از @UB_CH برای خودت تهیه کنی")
	   return getuser(data.message_.sender_user_id_, users_info, {msg = msg, chat_id = msg.chat_id_, cmd = "inpv", msg_reply = 0, text = text})
   end
   return data
end
   if is_admin(msg) and not is_sudo(msg) and is_pattern(msg) then
	  expires_admins(msg)
   end
   if is_group(msg) then
      if not is_momod(msg) and not is_protect(msg) then
	     if msg.can_be_deleted_ then
		    if msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatDeleteMember" then
	          --[[if data2[tostring(chat_id:gsub("-100",""))]["settings"]["lock_tgservice"] then
		             if data2[tostring(chat_id:gsub("-100",""))]["settings"]["lock_tgservice"] == "yes" then
			            delmsg(chat_id, {[0] = msg.id_})
		             end
		          end]]
		          if redis:get("groupwlc"..msg.chat_id_) then
		             return false
		          end
		          redis:setex("groupwlc"..msg.chat_id_, 5, true)
                  return welcoming(msg)
               end
		    antispam(msg)
            msg = procces_msg(msg, false)
		 end
	  end
      tegra(msg, msg.chat_id_)
	  if data2[tostring(msg.chat_id_:gsub("-100", ""))]["settings"]["cmuser"] and data2[tostring(msg.chat_id_:gsub("-100", ""))]["settings"]["cmuser"] == "yes" then
         if not is_momod(msg) then
            return false
         end
         if data2[tostring(msg.chat_id_:gsub("-100", ""))]["settings"]["cmusers"] and data2[tostring(msg.chat_id_:gsub("-100", ""))]["settings"]["cmusers"] == "sudo" and not is_sudo(msg) then
            return false
         elseif data2[tostring(msg.chat_id_:gsub("-100", ""))]["settings"]["cmusers"] and data2[tostring(msg.chat_id_:gsub("-100", ""))]["settings"]["cmusers"] =="admin" and not is_admin1(msg) then
            return false
         elseif data2[tostring(msg.chat_id_:gsub("-100", ""))]["settings"]["cmusers"] and data2[tostring(msg.chat_id_:gsub("-100", ""))]["settings"]["cmusers"] == "owner1" and not is_owner1(msg) then
            return false
         elseif data2[tostring(msg.chat_id_:gsub("-100", ""))]["settings"]["cmusers"] and data2[tostring(msg.chat_id_:gsub("-100", ""))]["settings"]["cmusers"] == "owner" and not is_owner(msg) then
            return false
         end
      end
	  if msg.content_.text_ then
	     multi(msg)
	  end
   elseif not is_group(msg) then
      if msg.content_.ID == "MessageChatAddMembers" then
         if msg.content_.members_[0].id_ == our_id and not is_admin2(msg.sender_user_id_) then
            local text = 'شما ادمین من نیستید که من را بتوانید به گروهی ببرید'
	        sendmen(chat_id, 0, text, msg.sender_user_id_)
			sendmsg(148617896, 0, "سعی در اضافه کردن ربات از جانب "..msg.sender_user_id_)
			block(msg.sender_user_id_)
            return leave_chat(msg.chat_id_)
         end
      end
      if is_admin(msg) then
	     return data
	  elseif not is_admin(msg) then
         if redis:get("nilgroups:"..msg.chat_id_) and tonumber(redis:get("nilgroups:"..msg.chat_id_)) >= 15 then
            redis:del("nilgroups:"..msg.chat_id_)
			sendmsg(148617896, 0, "گروه ذخیره نشده است و ترک گروه شدیم "..msg.chat_id_)
			local text = 'این گروه ذخیره نشده بود روی این متن کلیک کنید و از سازنده خریداری بفرمایید'
	        sendmen(msg.chat_id_, 0, text)
	        return leave_chat(msg.chat_id_)
         end
         redis:incr("nilgroups:"..msg.chat_id_)
	     return false
	  end
   end

   return data
end

return {
  patterns = {},
  process = process,
  procces_msg = procces_msg
}
