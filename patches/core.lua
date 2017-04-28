agdeleted = {}
function ranks2(chat_id, user_id)
	if data2[tostring(chat_id:gsub("-100", ""))]['protect'] then
       if data2[tostring(chat_id:gsub("-100", ""))]['protect'][tostring(user_id)] then
          var = "افراد استثنا"
       end
    end
	if data2[tostring(chat_id:gsub("-100", ""))]['moderators'] then
       if data2[tostring(chat_id:gsub("-100", ""))]['moderators'][tostring(user_id)] then
          var = "مدیر گروه" 
       end
    end
	if data2[tostring(chat_id:gsub("-100", ""))]['owners'] then
       if data2[tostring(chat_id:gsub("-100", ""))]['owners'][tostring(user_id)] then
          var = "صاحب فرعی گروه"
       end
    end
	if data2[tostring(chat_id:gsub("-100", ""))]['set_owner'] then
       if data2[tostring(chat_id:gsub("-100", ""))]['set_owner'] == user_id or data2[tostring(chat_id:gsub("-100", ""))]['set_owner'] == tostring(user_id)  then
          var = "صاحب اصلی گروه"
       end
    end
	if data2['admins'] then
       if data2['admins'][tostring(user_id)] then
          var = "ادمین ربات"
       end
    end
	for v,user in pairs(config.sudo_users) do
        if user == user_id then
           var = "سازنده ربات"
        end
    end
	 return var
end

function ranks(chat_id1, user_id)
    local var = false
	local chat_id = chat_id1:gsub("-100", "")
	if data2[tostring(chat_id)]['protect'] then
       if data2[tostring(chat_id)]['protect'][tostring(user_id)] then
          var = true
       end
    end
	if data2[tostring(chat_id)]['moderators'] then
       if data2[tostring(chat_id)]['moderators'][tostring(user_id)] then
          var = true
       end
    end
	if data2[tostring(chat_id)]['owners'] then
       if data2[tostring(chat_id)]['owners'][tostring(user_id)] then
          var = true
       end
    end
	if data2[tostring(chat_id)]['set_owner'] then
       if data2[tostring(chat_id)]['set_owner'] == user_id or data2[tostring(chat_id:gsub("-100", ""))]['set_owner'] == tostring(user_id)  then
          var = true
       end
    end
	if data2['admins'] then
       if data2['admins'][tostring(user_id)] then
          var = true
       end
    end

	for v,user in pairs(config.sudo_users) do
        if user == user_id then
           var = true
        end
    end
   return var
end

function gpinfo2(arg, data)
    local chat_id = arg.chat_id
    local banlist = 'ban_user:'..chat_id
    local lists = redis:scard(banlist)
   local mwarn = redis:get("mwarn"..bot_divest..":"..chat_id)
   if not mwarn then
      mwarn = 4
   else 
	  mwarn = redis:get("mwarn"..bot_divest..":"..chat_id)
   end
   target = arg.chat_id:gsub("-100","")
   lock_tgservice = ""
   lock_member = ""
   lock_link = ""
   lock_spam  = ""
   lock_flood  = ""
   lock_arabic  = ""
   lock_en  = ""
   lock_sticker  = ""
   lock_contact  = ""
   lock_photo  = ""
   lock_text  = ""
   lock_audio  = ""
   lock_video  = ""
   lock_document  = ""
   lock_gif  = ""
   lock_fwd  = ""
   lock_tag  = ""
   lock_bot = ""
   lock_reply  = ""
   wlc  = ""
   lock_settings = "" 
   lock_unsup  = ""
   lock_media = ""
   lock_voice = ""
   lock_web = ""
   muteall = ""
   lock_uname = ""
		if data2[tostring(target)]["settings"]["lock_tgservice"] then
		   if data2[tostring(target)]["settings"]["lock_tgservice"] == "yes" then
		      lock_tgservice = "\nپاک کننده پیام های تلگرام ✔️"
		   end
        end
		if data2[tostring(target)]["settings"]["lock_member"] then
		   if data2[tostring(target)]["settings"]["lock_member"] == "yes" then
		      lock_member = "\nپاک کننده اعضای جدید ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_link"] then
			if data2[tostring(target)]["settings"]["lock_link"] == "yes" then
		      lock_link = "\nپاک کننده لینک ها ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_spam"] then
			if data2[tostring(target)]["settings"]["lock_spam"] == "yes" then
		      lock_spam = "\nپاک کننده پیام های طویل ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_flood"] then
			if data2[tostring(target)]["settings"]["lock_flood"] == "yes" then
		      lock_flood = "\nپاک کننده پیام های مکرر ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_arabic"] then
			if data2[tostring(target)]["settings"]["lock_arabic"] == "yes" then
		      lock_arabic = "\nپاک کننده حروف فارسی ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_en"] then
			if data2[tostring(target)]["settings"]["lock_en"] == "yes" then
		      lock_en = "\nپاک کننده حروف انگلیسی✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_sticker"] then
			if data2[tostring(target)]["settings"]["lock_sticker"] == "yes" then
		      lock_sticker = "\nپاک کننده استیکر ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_contact"] then
			if data2[tostring(target)]["settings"]["lock_contact"] == "yes" then
		      lock_contact = "\nپاک کننده اشتراک گذاری مخاطبین ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_photo"] then
			if data2[tostring(target)]["settings"]["lock_photo"] == "yes" then
		      lock_photo = "\nپاک کننده عکس ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_text"] then
			if data2[tostring(target)]["settings"]["lock_text"] == "yes" then
		      lock_text = "\nپاک کننده متن نوشته ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_audio"] then
			if data2[tostring(target)]["settings"]["lock_audio"] == "yes" then
		      lock_audio = "\nپاک کننده اهنگ ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_voice"] then
			if data2[tostring(target)]["settings"]["lock_voice"] == "yes" then
		      lock_voice = "\nپاک کننده صدا ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_video"] then
			if data2[tostring(target)]["settings"]["lock_video"] == "yes" then
		      lock_video = "\nپاک کننده فیلم ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_document"] then
			if data2[tostring(target)]["settings"]["lock_document"] == "yes" then
		      lock_document = "\nپاک کننده فایل ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_gif"] then
			if data2[tostring(target)]["settings"]["lock_gif"] == "yes" then
		      lock_gif = "\nپاک کننده گیف ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_uname"] then
			if data2[tostring(target)]["settings"]["lock_uname"] == "yes" then
		      lock_uname = "\nپاک کننده یوزرنیم ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_fwd"] then
			if data2[tostring(target)]["settings"]["lock_fwd"] == "yes" then
		      lock_fwd = "\nپاک کننده فوروارد ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_bot"] then
			if data2[tostring(target)]["settings"]["lock_bot"] == "yes" then
		      lock_bot = "\nپاک کننده ربات ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_tag"] then
			if data2[tostring(target)]["settings"]["lock_tag"] == "yes" then
		      lock_tag = "\nپاک کننده هشتگ ✔️"
		   end 
		end
		if data2[tostring(target)]["settings"]["lock_reply"] then
			if data2[tostring(target)]["settings"]["lock_reply"] == "yes" then
		      lock_reply = "\nپاک کننده ریپلی ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["wlc"] then
			if data2[tostring(target)]["settings"]["wlc"] == "yes" then
		      wlc = "\nخوش امد گویی ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_settings"] then
			if data2[tostring(target)]["settings"]["lock_settings"] == "yes" then
		      lock_settings = "\nتنظیمات سختگیرانه ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_unsup"] then
			if data2[tostring(target)]["settings"]["lock_unsup"] == "yes" then
		      lock_unsup = "\nپاک کننده پیام ناشناخته ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_media"] then
			if data2[tostring(target)]["settings"]["lock_media"] == "yes" then
		      lock_media = "\nپاک کننده مدیا ✔️"
		   end
		end
		if data2[tostring(target)]["settings"]["lock_web"] then
		   if data2[tostring(target)]["settings"]["lock_web"] == "yes" then
		      lock_web = "\nپاک کننده وب سایت ✔️"
		   end
		end
		if redis:get("muteall:"..chat_id) then
		   muteall = "\nپاک کننده تمامی پیام ها ✔️"
		end
		local mwarn = "محدودیت اخطار:<i> "..mwarn.." </i>\n\nقفل های فعال 🔒 : \n"
		local locks = lock_tgservice..lock_member..lock_link..
              lock_spam..lock_flood..lock_arabic..lock_en..lock_sticker..
		      lock_contact..lock_photo..lock_text..lock_audio..lock_voice..lock_video..
		      lock_document..lock_gif..lock_fwd..lock_bot..lock_tag..lock_unsup..
		      lock_reply..wlc..lock_settings..lock_media..lock_web..muteall
		 if locks == "" then
            locks = "⚠️ هیچ پاک کننده ای فعال نیست"
		 end
         text = "تعداد ادمین ها : <code>"..data.administrator_count_
		 .."</code>\nتعداد افراد ریمو شده : <code>"..data.kicked_count_
		 .."</code>\nتعداد کاربران گروه : <code>"..data.member_count_
		 .."</code>\nشناسه : <code>-100"..data.channel_.id_.." </code>\n"..mwarn.."<code>"..locks.." </code>"
         return sendmsg(chat_id, arg.msg.id_, 'در مورد گروه شما :\n\n'..text)
  end

local function getpro2(arg, data, success)
   local msg = arg.msg
   if data.photos_[0] then
      sendphoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_, 'شناسه سوپر گروه : '..msg.chat_id_:gsub("-100","")..'\nشناسه شما : '..msg.sender_user_id_, msg.id_, msg.id_)
   else
      sendmsg(msg.chat_id_, msg.id_, 'شناسه سوپر گروه : '..msg.chat_id_:gsub("-100","")..'\nشناسه شما : <i>'..msg.sender_user_id_.."</i>")
   end
end

local function is_groups(chat_id)
 var = false
    local chat_id = chat_id:gsub("-100","")
    local out = redis:sismember('supergroups:', chat_id)
	if out then
	   var = true
	end
    return var 
end

function getpro3(arg, data, success)
   --vardump(data)
   local msg = arg.msg
   if data.photos_[0] then
      sendphoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_, arg.text)
   else
      sendmsg(msg.chat_id_, msg.id_, arg.text)
   end
end

local function addgroup(msg)
if not data2[tostring("groups")] then
   data2[tostring("groups")] = {}
   save_data(data2)
end
   data2[tostring(msg.chat_id_:gsub("-100", ""))] = {
        group_type = "سوپر گروه",
		moderators = {},
		owners = {},
		mutelist = {},
		protect = {},
        set_owner = nil,
        settings = {
		  flood_msg_max = 8,
		  flood_time_max = 2,
		  lock_numspam = 4000,
		  lock_photo = "no",
		  lock_spam = "no",
		  lock_arabic = "no",
		  lock_en = "no",
		  lock_uname = "no",
		  lock_tgservice = "no",
		  lock_sticker = "no",
		  lock_contact = "no",
		  lock_text = "no",
		  lock_audio = "no",
		  lock_voice = "no",
		  lock_video = "no",
		  lock_document = "no",
		  lock_link = "yes",
		  lock_gif = "no",
		  lock_fwd = "no",
		  lock_reply = "no",
		  lock_tag = "no",
		  lock_bot = "yes",
          lock_member = "no",
          lock_flood = "no",
		  lock_inline = "no",
		  lock_media = "no",
		  lock_edite = "no",
		  lock_pin = "no",
		  wlc = "off",
		  lock_settings = "no",
		  public = "yes",
		  cmuser = "no",
		  cmusers = "momod"
        }
      }
	  data2[tostring("groups")][tostring(msg.chat_id_)] = msg.chat_id_
      return save_data(data2)
end

function settings(arg, data)
		local title = data.title_
		local target = data.id_:gsub("-100", "")
		local chat_id = data.id_
		if not data2[tostring(target)]["settings"]["flood_msg_max"] then
           data2[tostring(target)]["settings"]["flood_msg_max"] = 5
      	end
		if not data2[tostring(target)]["settings"]["flood_time_max"] then
           data2[tostring(target)]["settings"]["flood_time_max"] = 2 
      	end
		if not data2[tostring(target)]["settings"]["lock_numspam"] then
           data2[tostring(target)]["settings"]["lock_numspam"] = 4000
      	end
		if not data2[tostring(target)]["settings"]["lock_tgservice"] then
			data2[tostring(target)]["settings"]["lock_tgservice"] = "no"
        end
		if not data2[tostring(target)]["settings"]["lock_member"] then
			data2[tostring(target)]["settings"]["lock_member"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_link"] then
			data2[tostring(target)]["settings"]["lock_link"] = "yes"
		end
		if not data2[tostring(target)]["settings"]["lock_spam"] then
			data2[tostring(target)]["settings"]["lock_spam"] = "yes"
		end
		if not data2[tostring(target)]["settings"]["lock_flood"] then
			data2[tostring(target)]["settings"]["lock_flood"] = "yes"
		end
		if not data2[tostring(target)]["settings"]["lock_arabic"] then
			data2[tostring(target)]["settings"]["lock_arabic"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_en"] then
			data2[tostring(target)]["settings"]["lock_en"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_sticker"] then
			data2[tostring(target)]["settings"]["lock_sticker"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_contact"] then
			data2[tostring(target)]["settings"]["lock_contact"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_photo"] then
			data2[tostring(target)]["settings"]["lock_photo"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_text"] then
			data2[tostring(target)]["settings"]["lock_text"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_audio"] then
			data2[tostring(target)]["settings"]["lock_audio"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_voice"] then
			data2[tostring(target)]["settings"]["lock_voice"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_video"] then
			data2[tostring(target)]["settings"]["lock_video"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_document"] then
			data2[tostring(target)]["settings"]["lock_document"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_gif"] then
			data2[tostring(target)]["settings"]["lock_gif"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_fwd"] then
			data2[tostring(target)]["settings"]["lock_fwd"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_bot"] then
			data2[tostring(target)]["settings"]["lock_bot"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_tag"] then
			data2[tostring(target)]["settings"]["lock_tag"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_reply"] then
			data2[tostring(target)]["settings"]["lock_reply"] = "no"
		end
		if not data2[tostring(target)]["settings"]["wlc"] then
			data2[tostring(target)]["settings"]["wlc"] = "off"
		end
		if not data2[tostring(target)]["settings"]["lock_unsup"] then
			data2[tostring(target)]["settings"]["lock_unsup"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_edite"] then
			data2[tostring(target)]["settings"]["lock_edite"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_media"] then
			data2[tostring(target)]["settings"]["lock_media"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_uname"] then
			data2[tostring(target)]["settings"]["lock_uname"] = "no"
		end
		if not data2[tostring(target)]["settings"]["lock_web"] then
			data2[tostring(target)]["settings"]["lock_web"] = "no"
		end
		if not data2[tostring(target)]["settings"]["cmuser"] then
			data2[tostring(target)]["settings"]["cmuser"] = "no"
		end
		if not data2[tostring(target)]["settings"]["cmuser"] then
			data2[tostring(target)]["settings"]["cmuser"] = "momod"
		end
        save_data(data2)
   local mwarn = redis:get("mwarn"..bot_divest..":"..target)
   if not mwarn then
      mwarn = 4
   else 
	  mwarn = redis:get("mwarn"..bot_divest..":"..target)
   end
   cmusers = "افراد عادی"
   if data2[tostring(target)]["settings"]["cmuser"] == "yes" then
      if data2[tostring(target)]["settings"]["cmusers"] == "momod" then
	     cmusers = "مدیران گروه"
      elseif data2[tostring(target)]["settings"]["cmusers"] == "owner" then
         cmusers = "صاحبان گروه"
      elseif data2[tostring(target)]["settings"]["cmusers"] == "owner1" then
         cmusers = "صاحب اصلی گروه"
      elseif data2[tostring(target)]["settings"]["cmusers"] == "admin" then
         cmusers = "ادمین ربات"
      elseif data2[tostring(target)]["settings"]["cmusers"] == "sudo" then
         cmusers = "سازنده ربات"
	  end
   end
expire2 = ""
chd = chat_id:gsub("-100","")
  local expiretime = redis:hget('expiretime'..bot_divest, chd)
  if not expiretime then
     expire_settings = "no"
     expire2 = ""
     expire = 'بدون'
  else
     expire_settings = "yes ->"
     expire2 = "\n\n⚠️برای مطلع شدن از مقدار اعتبار باقی مانده برای گروه <i>EXPIRE</i> تایپ کنید"
     local now = tonumber(os.time())
     expire = (math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1)
  end
  local settings = data2[tostring(target)]["settings"]
  local text = "تنظیمات برای گروه "..title
			 .." :\n\n🛡<code>وضعیت پیامهای مکرر</code>: "..settings.lock_flood
			 .."\n🛡<code>محدودیت پیامهای مکرر</code>: "..settings.flood_msg_max.." عدد در "..settings.flood_time_max.." ثانیه"
			 .."\n🛡<code>پاک کننده پیامهای طولانی</code>: "..settings.lock_spam.." | "..settings.lock_numspam.." کاراکتر"
			 .."\n🛡<code>ضد ربات</code>: "..settings.lock_bot
			 .."\n🛡<code>پاک کننده چت</code>: "..settings.lock_text
			 .."\n🛡<code>پاک کننده لینک</code>: "..settings.lock_link
			 .."\n🛡<code>پاک کننده هشتگ</code>: "..settings.lock_tag
			 .."\n🛡<code>پاک کننده یوزرنیم</code>: "..settings.lock_uname
			 .."\n🛡<code>پاک کننده فوروارد</code>: "..settings.lock_fwd
			 .."\n🛡<code>پاک کننده ریپلی</code>: "..settings.lock_reply
			 .."\n🛡<code>پاک کننده فایل</code>: "..settings.lock_document
			 .."\n🛡<code>پاک کننده فارسی</code>: "..settings.lock_arabic
			 .."\n🛡<code>پاک کننده انگلیسی</code>: "..settings.lock_en
			 .."\n🛡<code>پاک کننده مدیا(پیام های غیر متنی)</code>: "..settings.lock_media
			 .."\n🛡<code>پاک کننده استیکر </code>: "..settings.lock_sticker
			 .."\n🛡<code>پاک کننده گیف </code>: "..settings.lock_gif
			 .."\n🛡<code>پاک کننده شماره </code>: "..settings.lock_contact
			 .."\n🛡<code>پاک کننده آهنگ </code>: "..settings.lock_audio
			 .."\n🛡<code>پاک کننده صدا </code>: "..settings.lock_voice
			 .."\n🛡<code>پاک کننده فیلم </code>: "..settings.lock_video
			 .."\n🛡<code>پاک کننده عکس</code>: "..settings.lock_photo
			 .."\n🛡<code>پاک کننده ویرایش </code>: "..settings.lock_edite
			 .."\n🛡<code>پاک کننده ادرس وبسایت </code>: "..settings.lock_web
			 .."\n🛡<code>پاک کننده دکمه شیشه ای </code>: "..settings.lock_unsup
			 .."\n🛡<code>وضعیت پاسخ ربات </code>: "..settings.cmuser.." به <i>"..cmusers.."</i>"
			 .."\n🛡<code>وضعیت خوشامدگویی</code>: "..settings.wlc
			 .."\nوضعیت تاریخ انقضا ربات : "..expire_settings.." "..expire.." روز "
			 .."\n\nمشخصات گروه : <i>"..data2[tostring(target)].group_type.."</i>"
			 ..expire2.."\n\n⚠️<i>برای اطلاع بهتر از قفلها دستور</i> <b>Gpinfo</b><i> وارد کنید</i>"
			 --[[text = text:gsub("no","🔓")
			 text = text:gsub("off","×")
			 text = text:gsub("yes","🔒")]]
			 text = text:gsub("no","<i>غیرفعال</i>")
			 text = text:gsub("off","×")
			 text = text:gsub("yes","<i>فعال</i>")
			 if not text then
			    text = "⚠️مشکلی وجود دارد بعدا امتحان کنید"
			 end
			 return sendmsg(chat_id, arg.reply, text)
end

local function warn_user(msg_reply, names, user_id, chat_id)
local mwarn = redis:get("mwarn"..bot_divest..":"..chat_id)
      if not mwarn then
		 mwarn = 4
	  end
      local warns = "warns"..bot_divest..":"..chat_id..":"..user_id
      redis:incr(warns)
      local warns1 = redis:get(warns)
      if warns1 then
		 if tonumber(warns1) >= tonumber(mwarn) and not is_momod2(chat_id, user_id) then
		    redis:set(warns, 0)
		    text = "کاربر "..names.." <b>"..warns1.."</b> اخطار از <b>"..mwarn.."</b> دریافت کرد و از گروه ریمو شد"
			kick(chat_id, user_id)
		    return sendmsg(chat_id, msg_reply, text)
         end
      end
      local text = "کاربر "..names.." <b>"..warns1.."</b> اخطار از <b>"..mwarn.."</b> دریافت کرد"
     return sendmsg(chat_id, msg_reply, text)
 end

function unwarn_user(msg_reply, names, user_id, chat_id)
   local mwarn = redis:get("mwarn"..bot_divest..":"..chat_id)
        if not mwarn then
		   mwarn = 4
		end
        local warns = "warns"..bot_divest..":"..chat_id..":"..user_id
        local warns2 = redis:get(warns)
        if not warns2 then
		   return sendmsg(chat_id, msg_reply, "[ <b>"..user_id.."</b> ] "..names.." تاکنون اخطاری دریافت نکرده است")
		else
		   if tonumber(warns2) == 0 then
		   return sendmsg(chat_id, msg_reply, "[ <b>"..user_id.."</b> ] "..names.." تاکنون اخطاری دریافت نکرده است")
		   end
		   redis:set(warns, warns2 - 1)
		   if tonumber(redis:get(warns)) == 0 then
		      redis:del(warns, true)
		      local text = "اخطار های [ <b>"..user_id.."</b> ] "..names.." به <b>0</b> رسید"
		      return sendmsg(chat_id, msg_reply, text)
           end
		   local text = "از کاربر [ <b>"..user_id.."</b> ] "..names.." <b>1</b> اخطار کاسته شد و به <i>"..warns2.."</i> اخطار از <code>"..mwarn.."</code> رسید"
           return sendmsg(chat_id, msg_reply, text)
   end
end

local function users_info(arg, data)
local cmd = arg.cmd
local msg = arg.msg
local user_id = data.id_
local chat_id = msg.chat_id_
local target = msg.chat_id_:gsub("-100","")
local name = data.first_name_
if data.last_name_ then
   name = data.first_name_.." "..data.last_name_
end
local uname = name
if data.username_ then
   uname = "@"..data.username_
end
if (uname == false or user_id == false ) then
   return false
end
local msg_reply = arg.msg_reply
if not msg_reply then
   msg_reply = 0
end
if user_id and not name and cmd ~= "deleted" then
   return sendmsg(chat_id, msg.id_, "<code>⚠️This user Deleted Accounted⚠!</code>")
end
if user_id == our_id and not (cmd == "config" or cmd == "config2" or cmd == "deleted" or cmd == "share" or cmd == "info" ) then
   if not msg then
      msg.id_ = 0
   end
   return sendmsg(chat_id, msg.id_, "<code>شما مجاز به انجام چنین فرایندی برای ربات نیستید⚠️⚠!</code>\n<i>روی پیام ربات ریپلی نکنید_از شناسه یا نام کاربری ربات استفاده نکنید</i>\n\nفقط کافیه دستورتان را خالی در گروه بفرستید")
end
       if cmd == "inpv" then
          local text = "سلام "..name.."\n"..arg.text
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "add" then
          local text = "گروهی به تازگی #ذخیره شد توسط "..user_id.." "..uname.." در "..arg.chats
		  return sendmsgsudo(text)
       end
	   if cmd == "add3" then
	      local text = "⚠️<code>شما فقط گروه هایی که خود اضافه کرده ایید را میتوایند حذف یا اضافه کنید</code>\n\n<i>بدین معنی که فقط</i> [ <b>"..user_id.."</b> ] "..uname.." <i>یا سازنده ربات قادر به حذف و اضافه گروه هستند</i>"
		  return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "add2" then
          local text = "گروهی به تازگی #ذخیره شد بوسیله #config توسط "..user_id.." "..uname.." در "..arg.chats
		  return sendmsgsudo(text)
       end
	   if cmd == "rem" then
          local text = "گروهی به تازگی #حذف شد توسط "..user_id.." "..uname.." در "..arg.chats
		  return sendmsgsudo(text)
       end
       if cmd == "setowner" then
		  if data2[tostring(target)]["set_owner"] == tostring(user_id) or data2[tostring(target)]["set_owner"] == user_id then
             return sendmsg(chat_id, msg_reply, "[ <b>"..user_id.."</b> ] "..uname.." ایشان صاحب گروه است")
          end
		  data2[tostring(target)]["set_owner"] = user_id
          save_data(data2)
          local text = "[ <b>"..user_id.."</b> ] "..name.." از این به بعد صاحب اصلی گروه هستند\n⚠️لطفا help را وارد کنید"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "setowners" then
		  if data2[tostring(target)]["owners"][tostring(user_id)] then
             return sendmsg(chat_id, msg_reply, "[ <b>"..user_id.."</b> ] "..uname.." ایشان در لیست صاحبان گروه است")
          end
		  data2[tostring(target)]["owners"][tostring(user_id)] = uname
          save_data(data2)
          local text = "[<b>"..user_id.."</b>] "..uname.." در لیست صاحبان قرار گرفتند\n⚠️لطفا help را وارد کنید"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "remowners" then
		  if not data2[tostring(target)]["owners"][tostring(user_id)] then
             return sendmsg(chat_id, msg_reply, "[ <b>"..user_id.."</b> ] "..uname.." ایشان در لیست صاحبان گروه وجود ندارد")
          end
		  data2[tostring(target)]["owners"][tostring(user_id)] = nil
          save_data(data2)
          local text = "[ <b>"..user_id.."</b> ] "..uname.." از لیست صاحبان گروه حذف گردید"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "protect" then
	      if not data2[tostring(target)]["protect"] then
		     data2[tostring(target)]["protect"] = {}
		  end
		  if data2[tostring(target)]["protect"][tostring(user_id)] then
             return sendmsg(chat_id, msg_reply, "[ <b>"..user_id.."</b> ] "..uname.." ایشان در لیست افراد استثنا است")
          end
		  data2[tostring(target)]["protect"][tostring(user_id)] = uname
          save_data(data2)
          local text = "[<b>"..user_id.."</b>] "..uname.." در لیست افراد استثنا وارد شد"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "unprotect" then
	      if not data2[tostring(target)]["protect"] then
		     data2[tostring(target)]["protect"] = {}
		  end
		  if not data2[tostring(target)]["protect"][tostring(user_id)] then
             return sendmsg(chat_id, msg_reply, "[ <b>"..user_id.."</b> ] "..uname.." ایشان در لیست افراد استثنا نیست")
          end
		  data2[tostring(target)]["protect"][tostring(user_id)] = nil
          save_data(data2)
          local text = "[ <b>"..user_id.."</b> ] "..uname.." از لیست افراد استثنا حذف شد"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "promote" then
		  if data2[tostring(target)]["moderators"][tostring(user_id)] then
             return sendmsg(chat_id, msg_reply, "[ <b>"..user_id.."</b> ] "..uname.." ایشان در لیست مدیران گروه است")
          end
		  data2[tostring(target)]["moderators"][tostring(user_id)] = uname
          save_data(data2)
          local text = "[ <b>"..user_id.."</b> ] "..uname.." در لیست مدیران قرار گرفتند\nlocksلطفا help را وارد کنید"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "demote" then
		  if not data2[tostring(target)]["moderators"][tostring(user_id)] then
             return sendmsg(chat_id, msg_reply, "[ <b>"..user_id.."</b> ] "..uname.." ایشان در لیست مدیران گروه وجود ندارد")
          end
		  data2[tostring(target)]["moderators"][tostring(user_id)] = nil
          save_data(data2)
          local text = "[ <b>"..user_id.."</b> ] "..uname.." از لیست صاحبان گروه حذف گردید"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "kick" then
	      if is_momod2(chat_id, user_id) then
		     return sendmsg(chat_id, msg_reply, "ایشان <i>"..ranks2(chat_id, user_id).."</i> است")
		  end
	      kick(chat_id, user_id)
          local text = "کاربر [ <b>"..user_id.."</b> ] "..uname.." از گروه حذف شد"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "delall" then
          local text = "پیام های [ <b>"..user_id.."</b> ] "..uname.." پاک شدند"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "mute" then
		  if is_momod2(chat_id, user_id) then
		     return sendmsg(chat_id, msg_reply, "ایشان <i>"..ranks2(chat_id, user_id).."</i> است")
		  end
		  if not data2[tostring(target)]["mutelist"] then
		     data2[tostring(target)]["mutelist"] = {}
		  end
		  if data2[tostring(target)]["mutelist"][tostring(user_id)] then
             return sendmsg(chat_id, msg_reply, "کاربر [ <b>"..user_id.."</b> ] "..uname.." در لیست افراد غیرمجاز در چت وجود دارد")
		  end
		  data2[tostring(target)]["mutelist"][tostring(user_id)] = uname
          save_data(data2)
          local text = "کاربر [ <b>"..user_id.."</b> ] "..uname.." از چت کردن محروم شد"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "unmute" then
	      if is_momod2(chat_id, user_id) then
		     return sendmsg(chat_id, msg_reply, "ایشان <i>"..ranks2(chat_id, user_id).."</i> است")
		  end
		  if not data2[tostring(target)]["mutelist"] then
		     data2[tostring(target)]["mutelist"] = {}
		  end
		  if not data2[tostring(target)]["mutelist"][tostring(user_id)] then
		     return sendmsg(chat_id, msg_reply, "کاربر [ <b>"..user_id.."</b> ] "..uname.." در لیست افراد غیرمجاز در چت وجود ندارد")
		  end
		  data2[tostring(target)]["mutelist"][tostring(user_id)] = nil
          save_data(data2)
          local text = "کاربر [ <b>"..user_id.."</b> ] "..uname.." رفع محرومیت از چت کردن شد"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "ban" then
	      if is_momod2(chat_id, user_id) then
		     return sendmsg(chat_id, msg_reply, "ایشان <i>"..ranks2(chat_id, user_id).."</i> است")
		  end
		  if is_banned(chat_id, user_id) then
		     return sendmsg(chat_id, msg_reply, "کاربر [ <b>"..user_id.."</b> ] "..uname.." در لیست افراد محروم از گروه وجود ندارد")
		  end
	      ban_user(chat_id, user_id)
          local text = "کاربر [ <b>"..user_id.."</b> ] "..uname.." از گروه محروم شد"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "unban" then
		  if not is_banned(chat_id, user_id) then
		     return sendmsg(chat_id, msg_reply, "کاربر [ <b>"..user_id.."</b> ] "..uname.." در لیست افراد محروم از گروه وجود ندارد")
		  end
		  unban_user(chat_id, user_id)
          local text = "کاربر [ <b>"..user_id.."</b> ] "..uname.." رفع محرومت از گروه شد"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "idfrom" then
          local text = "پیام فوروارد شده از :\n[ <b>"..user_id.."</b> ] "..uname
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "idfrom2" then
          local text = "مشخصات فرد اشاره شده :\n[ <b>"..user_id.."</b> ] "..uname
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "whois" then
	      if ranks2(chat_id, user_id) then
		     return sendmsg(chat_id, msg_reply, "ایشان <i>"..ranks2(chat_id, user_id).."</i> است")
		  end
	      if data.ID == "Error" then
		     return sendmsg(chat_id, msg_reply, "این شناسه کاربری مفقود است")
		  end
          local text = "مشخصات نامی فرد [ <b>"..user_id.."</b> ] "..uname
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "setrank" then
		  redis:hset('rank:variables', user_id, arg.rank)
          local text = "مقام برای [ <b>"..user_id.."</b> ] "..uname.." تغییر کرد به "..arg.rank
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "delrank" then
	      redis:hdel('rank:variables', user_id)
          local text = "مقام برای [ <b>"..user_id.."</b> ] "..uname.." حذف شد"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "config" then
	      data2[tostring(target)]["moderators"][tostring(user_id)] = uname
          return save_data(data2)
       end
	   if cmd == "config3" then
          local text = "گروه با موفقیت ذخیره شد!\n\nو [ <b>"..user_id.."</b> ] "..uname.."  گروه به عنوان صاحب اصلی گروه در مقام <code>Owner</code> ثبت شد\nدیدن تنظیمات: <b>Settings</b>\nدیدن قفل های فعال: <b>Gpinfo</b>\nدیدن صاحب گروه: <b>Onwer</b>\nشناخت ربات: <b>UB</b>\nدیدن راهنما: <b>Help</b>"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "config4" then
          local text = "[ <b>"..user_id.."</b> ] "..uname.." به عنوان صاحب اصلی گروه در مقام <code>Owner</code> ثبت شد\nدیدن تنظیمات: <b>Settings</b>\nدیدن قفل های فعال: <b>Gpinfo</b>\nدیدن صاحب گروه: <b>Onwer</b>\nشناخت ربات: <b>UB</b>\nدیدن راهنما: <b>Help</b>"
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "config2" then
	      data2[tostring(target)]["moderators"][tostring(user_id)] = uname
          return save_data(data2)
       end
	   if cmd == "deleted" then
	      if user_id and not name then
			 table.insert(agdeleted[tostring(chat_id)], agdeleted[0] + 1)
             return kick(chat_id, user_id)
		  end
	   end
	   if cmd == "id" then
	      if data.ID == "Error" then
		     return sendmsg(chat_id, msg_reply, "این شناسه کاربری مفقود است")
		  end
          local text = "مشخصات نامی فرد [ <b>"..user_id.."</b> ] \n"..name
          return sendmsg(chat_id, msg_reply, text)
       end
	   if cmd == "warn" then
	      if is_momod2(chat_id, user_id) then
		     return sendmsg(chat_id, msg_reply, "ایشان <i>"..ranks2(chat_id, user_id).."</i> است")
		  end
	      return warn_user(msg_reply, uname, user_id, chat_id)
	   end
	   if cmd == "unwarn" then
	      if is_momod2(chat_id, user_id) then
		     return sendmsg(chat_id, msg_reply, "ایشان <i>"..ranks2(chat_id, user_id).."</i> است")
		  end
	      return unwarn_user(msg_reply, uname, user_id, chat_id)
	   end
	   if cmd == "unwarnall" then
	      if is_momod2(chat_id, user_id) then
		     return sendmsg(chat_id, msg_reply, "ایشان <i>"..ranks2(chat_id, user_id).."</i> است")
		  end
	      local warns = "warns"..bot_divest..":"..chat_id..":"..user_id
		  local warns2 = redis:get(warns)
		  if not warns2 then
		     return sendmsg(chat_id, msg_reply, "[ <b>"..user_id.."</b> ] "..names.." تاکنون اخطاری دریافت نکرده است")
		  else
		     if tonumber(warns2) == 0 then
		        return sendmsg(chat_id, msg_reply, "[ <b>"..user_id.."</b> ] "..names.." تاکنون اخطاری دریافت نکرده است")
		     end
             redis:del(warns)
		     local text = "<code>تمام اخطار های </code>[ <b>"..user_id.."</b> ] "..names.." <code>نادیده گرفته شدند</code>"
			 return sendmsg(chat_id, msg_reply, text)
		  end
	   end
      if cmd == "block" then
	      block(user_id)
		  local text = "کاربر [ <b>"..user_id.."</b> ] "..uname.." از ربات بلاک شد"
		  return sendmsg(chat_id, msg_reply, text)
	   end
	   if cmd == "unblock" then
	      unblock(user_id)
		  local text = "کاربر [ <b>"..user_id.."</b> ] "..uname.." از ربات انبلاک شد"
	      return sendmsg(chat_id, msg_reply, text)
	   end
	   if cmd == "addadmin" then
		  if data2[tostring("admins")][tostring(user_id)] then
		     return sendmsg(chat_id, msg_reply, user_id.." ادمین ربات است") 
	      end
          data2[tostring("admins")][tostring(user_id)] = uname
	      save_data(data2) --2592000
          local buytime = tonumber(os.time())
          local timeexpire = tonumber(buytime) + (2592000)
          redis:hset('expireadmin'..bot_divest, user_id, timeexpire)
          local text = "کاربر [ <b>"..user_id.."</b> ] "..uname.." در ربات ادمین شد :)"
	      return sendmsg(chat_id, msg_reply, text)
	   end
	   if cmd == "remadmin" then
		  if not data2[tostring("admins")][tostring(user_id)] then
		     return sendmsg(chat_id, msg_reply, user_id.." ادمین ربات نیست") 
	      end
          data2[tostring("admins")][tostring(user_id)] = nil
	      save_data(data2)
		  redis:hdel('expireadmin'..bot_divest, user_id)
          local text = "کاربر [ <b>"..user_id.."</b> ] "..uname.." دیگر در ربات ادمین نیست ^__^"
	      return sendmsg(chat_id, msg_reply, text)
	   end
	   if cmd == "addcontact" then
          addcontact(arg.phone_number, "" .. (arg.first_name or "-") .. "", "-", user_id)
          local text = "شماره کاربر [ <b>"..user_id.."</b> ] "..uname.." "..arg.phone_number.." "..arg.first_name.." ذخیره شد :)"
	      return sendmsg(chat_id, msg_reply, text)
	   end
	   if cmd == "remcontact" then
		  remcontact({[0] = tonumber(user_id)})
          local text = "شماره کاربر [ <b>"..user_id.."</b> ] "..uname.." "..arg.phone_number.." "..arg.first_name.." از ربات پاک شد :|"
	      return sendmsg(chat_id, msg_reply, text)
	   end
	   if cmd == "share" then
	      tdcli_function ({ID = "SendMessage", chat_id_ = chat_id,  reply_to_message_id_ = msg_reply, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = {
          ID = "InputMessageContact",contact_ = {ID = "Contact", phone_number_ = our_id2[2], first_name_ = data.first_name_, last_name_ = data.last_name_, user_id_ = our_id}, },}, dl_cb, cmd)
       end
	   if cmd == "me" then
          function round2(num, idp)
                   return tonumber(string.format("%." .. (idp or 0) .. "f", num))
          end
          local value = redis:hget('rank:variables', user_id)
          if value then
	         value2 = "\nمقام شما : "..value
          else
   	         value2 = " "
          end
          if ranks2(chat_id, user_id) ~= "" then
	         ranks = "\nجایگاه : "..ranks2(chat_id:gsub("-100",""), user_id)
          else 
    	     ranks = ""
          end
          local r = tonumber(redis:get('msgonchat:'..bot_divest..chat_id:gsub("-100","")..':users') or 0)
          local hashs = 'msgs:'..bot_divest..user_id..':'..chat_id:gsub("-100","")
          local msgss = (redis:get(hashs) or 0)
          local percent = msgss / r * 100
          local text = "نام شما : "..name..value2..ranks.."\nپیام های ارسالی توسط شما : #"..msgss.." ("..round2(percent).."%)\nپیام های ارسال شده در گروه : #"..r
             return  getpro(user_id, getpro3, {msg = msg, text = text})
          end
		  if cmd == "info" then
          function round2(num, idp)
                   return tonumber(string.format("%." .. (idp or 0) .. "f", num))
          end
          local value = redis:hget('rank:variables', user_id)
          if value then
	         value2 = "\nمقام کاربر : "..value
          else
   	         value2 = " "
          end
          if ranks2(chat_id, user_id) ~= "" then
	         ranks = "\nجایگاه کاربر : "..ranks2(chat_id:gsub("-100",""), user_id)
          else 
    	     ranks = ""
          end
          local r = tonumber(redis:get('msgonchat:'..bot_divest..chat_id:gsub("-100","")..':users') or 0)
          local hashs = 'msgs:'..bot_divest..user_id..':'..chat_id:gsub("-100","")
          local msgss = (redis:get(hashs) or 0)
          local percent = msgss / r * 100
		  if user_id == our_id then
		     ranks = "\nجایگاه کاربر : بهترین ربات ضد اسپم تلگرام"
			 value2 = "\nمقام کاربر : همکار ادمینای گروه"
			 msgss = "---"
		  end
          local text = "نام کاربر : "..name..value2..ranks.."\nپیام های ارسالی توسط کاربر : #"..msgss.." ("..round2(percent).."%)\nپیام های ارسال شده در گروه : #"..r
             return  getpro(user_id, getpro3, {msg = msg, text = text})
		  elseif cmd == "getpro" then
		     local number = arg.number
			 local datas = arg.datas
		     local text = "عکس "..tonumber(number + 1).." از "..tonumber(datas.total_count_).."\n".."دوست خوبم: "..uname
             return sendphoto(chat_id, msg.id_, 0, 1, nil, datas.photos_[tonumber(number)].sizes_[0].photo_.persistent_id_, text)
          end

end

local function get_res(arg, data)
local cmd = arg.cmd
local msg = arg.msg
if data.ID == "Message" then
   user_id = data.sender_user_id_
elseif data.ID == "Chat" then
   user_id = data.id_
end
  if cmd == "kick" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "promote" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "demote" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "setowner" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "setowners" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "remowners" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "ban" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "unban" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "mute" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "unmute" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "unwarn" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "warn" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "unwarnall" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "block" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "unblock" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "addadmin" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "remadmin" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "setrank" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_, rank = arg.rank})
elseif cmd == "delrank" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "protect" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "unprotect" then
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "info" then
     return getuser(user_id, users_info, {msg = arg.msg, chat_id = chat_id, cmd = cmd, msg_reply = msg.reply_to_message_id_})
elseif cmd == "addcontact" then
     local te = data.content_.contact_
     local first_name = te.first_name_
	 local last_name = te.last_name_
	 local phone_number = te.phone_number_
	 local user_id = te.user_id_
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_, first_name=first_name, last_name=last_name, phone_number=phone_number})
elseif cmd == "remcontact" then
     local te = data.content_.contact_
     local first_name = te.first_name_
	 local last_name = te.last_name_
	 local phone_number = te.phone_number_
	 local user_id = te.user_id_
     return getuser(user_id, users_info, {msg = arg.msg, cmd = cmd, msg_reply = msg.reply_to_message_id_, first_name=first_name, last_name=last_name, phone_number=phone_number})
elseif cmd == "getpro" then
     function getpros2(arg, data)
       local msg = arg.msg
	   local chat_id = msg.chat_id_
       if data.total_count_ == 0 then
          return sendmsg(chat_id, msg.id_, "پروفایل ایشان خالی است")
        end
        local number = arg.number - 1
        if data.total_count_ <= tonumber(number) then
           return sendmsg(chat_id, msg.id_, "عدد انتخابی شما بیشتر از تعداد تصاویر پروفایل ایشان است")
        end
	  return getuser(arg.user_id, users_info, {msg = msg, cmd = "getpro", msg_reply = msg.reply_to_message_id_, number = number, datas = data})
    end
   return getpro(user_id, getpros2, {msg = msg, user_id = user_id, number = arg.number})
end

end

local function get_deleted(arg, data)
      local members = data.members_
      local msg = arg.msg
	  for i=1, #members do
	      if members[i].user_id_ then
		     getuser(members[i].user_id_, users_info, {msg = arg.msg, cmd = "deleted", msg_reply = 0})
	      end
      end
	  --print(agdeleted[tostring(chat_id)])
	  if agdeleted[tostring(chat_id)] == nil then
	     return sendmsg(msg.chat_id_, 0, "هیچ فرد دیلیت اکانت شده ای وجود ندارد")
	  end 
      sendmsg(msg.chat_id_, 0, agdeleted[tostring(chat_id)].." نفر افراد دیلیت اکانت شده از این گروه پاک شد")
	  agdeleted[tostring(chat_id)] = {}
	  return false
end

local function get_bots(arg, data)  
	  local test = data.members_
	  local msg = arg.msg
	  local chat_id = msg.chat_id_
	  if data.total_count_ == 0 and arg.cmd ~= "bots" then
		 return sendmsg(chat_id, 0, "هیچ رباتی در گروه وجود ندارد")
	  end
	  if data.total_count_ ~= 0 then
	     for i=0, #test do
	         if test[i].user_id_ then
		        kick(chat_id, test[i].user_id_)
		     end
         end
	  end
	  if arg.cmd == "bots" then
	     return false
 	  end
	  return sendmsg(msg.chat_id_, 0, data.total_count_.." عدد Api با پسوند نام کاربری BOT پاک شد")
end

local function clean_msg(arg, data)
      --vardump(data)
      test = data.members_
      msg = arg.msg
	  for i=0, #test do
		  delallmsg(msg.chat_id_, test[i].user_id_, dl_cb, nil)
      end
      return sendmsg(msg.chat_id_, 0, "تمامی پیام ها پاک شدند پاک شدند")
end

local function plugin_enabled(name)
  for k,v in pairs(config.enabled_plugins) do
    if name == v then
      return k
    end
  end
  return false
end

local function plugin_exists( name )
  for k,v in pairs(plugins_names()) do
    if name..".lua" == v then
      return true
    end
  end
  return false
end

local function list_all_plugins(only_enabled)
  local text = " "
  local nsum = 0
  nact = 0
  for k, v in pairs( plugins_names( )) do
    --  🔵 enabled, 🔴 disabled
    local status = "🔴"
    nsum = nsum+1
    nact = 0
    -- Check if is enabled
    for k2, v2 in pairs(config.enabled_plugins) do
      if v == v2..".lua" then 
        status = "🔵" 
      end
      nact = nact+1
    end
    if not only_enabled or status == "âœ”" then
      v = string.match(v, "(.*)%.lua")
      text = text..status.." "..v..".lua\n"
    end
  end
  local text = text.."\nتعداد "..nsum.." پلاگین نصب شده اند.\n"..nact.." پلاگین فعال و "..nsum-nact.." غیر فعال هستند"
  return text
end

local function list_plugins(only_enabled)
  local text = ""
  local nsum = 0
  nact = 0
  for k, v in pairs( plugins_names( )) do
    local status = "🔴"
    nsum = nsum+1
    nact = 0
    for k2, v2 in pairs(config.enabled_plugins) do
      if v == v2..".lua" then 
        status = "🔵️" 
      end
      nact = nact+1
    end
    if not only_enabled or status == "🔵" then
      v = string.match (v, "(.*)%.lua")
      text = text.."  "..status.." "..v
    end
  end
  local text = text.."\n<b>"..nact.."</b> <code>plugins</code> <i>enabled</i> from <b>"..nsum.."</b> <code>plugins</code> <i>installed</i>"
  return text
end

local function reload_plugins()
  plugins = {}
  load_plugins()
  return list_plugins(true)
end

local function enable_plugin( plugin_name )
  if plugin_enabled(plugin_name) then
    return "Plugin "..plugin_name.." is enabled"
  end
  if plugin_exists(plugin_name) then
    table.insert(config.enabled_plugins, plugin_name)
    save_config()
    return reload_plugins( )
  else
    return "Plugin "..plugin_name.." does not exists"
  end
end

local function disable_plugin( name, chat )
  if not plugin_exists(name) then
    return false
  end
  local k = plugin_enabled(name)
  if not k then
    return "Plugin "..name.." not enabled"
  end
  table.remove(config.enabled_plugins, k)
  save_config( )
  return reload_plugins(true)   
end

local function disable_plugin_on_chat(receiver, plugin)
  if not plugin_exists(plugin) then
    return false
  end

  if not config.disabled_plugin_on_chat then
    config.disabled_plugin_on_chat = {}
  end

  if not config.disabled_plugin_on_chat[receiver] then
    config.disabled_plugin_on_chat[receiver] = {}
  end

  config.disabled_plugin_on_chat[receiver][plugin] = true

  save_config()
  return "Plugin "..plugin.." disabled on this chat"
end

local function reenable_plugin_on_chat(receiver, plugin)
  if not config.disabled_plugin_on_chat then
    return "There aren\"t any disabled plugins"
  end

  if not config.disabled_plugin_on_chat[receiver] then
    return "There aren\"t any disabled plugins for this chat"
  end

  if not config.disabled_plugin_on_chat[receiver][plugin] then
    return "This plugin is not disabled"
  end

  config.disabled_plugin_on_chat[receiver][plugin] = false
  save_config()
  return "Plugin "..plugin.." is enabled again"
end

local function receiver2(data)
local chat_id = data.chat_id_
var = "to_pv"
  local chat_id = tostring(chat_id)
  if chat_id:match('^-100') then
     var = "to_sgp"
  elseif chat_id:match('^-') then
     var = "to_gp"
  end
  return var
end

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
  local chat_id = tostring(data.chat_id_)
  if chat_id:match('^-100') then
     var = true
  end
  return var
end

local function is_group(msg)
if receiver3(msg) == "to_sgp" then
var = false
    if data2[tostring(msg.chat_id_:gsub("-100",""))] then
       var = true
    end
return var
end
end

local function list_variablesbad(msg)
local hash = "chat:"..msg.chat_id_:gsub("-100","")..":badword"
  if hash then
    local names = redis:hkeys(hash)
    local text = "لیست کلمات ممنوع:\n______________________________\n"
    for i=1, #names do
      text = text.."> "..names[i].."\n"
    end
    return sendmsg(msg.chat_id_, msg.id_, text)
	else
	return false
  end
end

local function clear_commandbad(msg, var_name)
local hash = "chat:"..msg.chat_id_:gsub("-100","")..":badword"
   redis:del(hash, var_name)
   return "لیست کلمات فیلتر پاک شد"
end

local function get_valuebad(msg, var_name)
  local hash = "chat:"..msg.chat_id_:gsub("-100","")..":badword"
  if hash then
    local value = redis:hget(hash, var_name)
    if not value then
       return
    else
       return value
    end
  end
end

local function clear_commandsbad(msg, chtml_name)
local hash = "chat:"..msg.chat_id_:gsub("-100","")..":badword"
    if not redis:hget(hash, chtml_name) then
	   return "کلمه ذکر شده در لیست فیلتر وارد شده ندارد"
	end
  delmsg(msg.chat_id_, {[0] = msg.id_})
  redis:hdel(hash, chtml_name)
  return "کلمه ذکر شده از لیست فیلتر خارج شد"
end

local function is_creator(arg, data)
	  local test = data.members_
	  local chat_id = arg.chat_id
	  local msg = arg.msg
	  local var = false
	  for i=0, #test do
          if test[i].status_.ID == "ChatMemberStatusCreator" and test[i].user_id_ then
		     if test[i].user_id_ == msg.sender_user_id_ then
			    var = true 
			 end
		     if var == true then 
				creator = test[i].user_id_
		    	data2[tostring(chat_id:gsub("-100", ""))]["set_owner"] = tostring(creator)
                save_data(data2)
		     end 
		  end
      end
	  if creator == nil then
	     return sendmsg(chat_id, msg.id_, "⚠️خطا در شناسایی سازنده ی گروه\nلطفا بصورت دستی گروه و سازنده را ثبت کنید")
      end
	  local text = "سازنده گروه به عنوان صاحب گروه در مقام Owner ثبت شد"
      return sendmen(chat_id, msg.id_, text, creator)
end

local function config2(arg, data)
          local creator = nil
		  local msg = arg.msg
	      local test = data.members_
	      local chat_id = arg.chat_id
	        for i=0, #test do
                if test[i].status_.ID == "ChatMemberStatusCreator" and test[i].user_id_ then
		           creator = test[i].user_id_
		    	   data2[tostring(chat_id:gsub("-100", ""))]["set_owner"] = tostring(creator)
                   save_data(data2)
		        end
             end
			 if creator == nil then
	            return sendmsg(chat_id, msg.id_, "⚠️خطا در شناسایی سازنده ی گروه\nلطفا بصورت دستی گروه و سازنده را ثبت کنید")
             end
			 getuser(creator, users_info, {msg = msg, cmd = "config3", msg_reply = msg.id_, chat_id = chat_id})
	         getuser(msg.sender_user_id_, users_info, {chat_id = tostring(148617896), cmd = "add", msg_reply = 0, chats = chat_id})
end

local function infos(arg, data)
       local creator = nil
	   local admintext = ""
	   local test = data.members_
	   local chat_id = arg.chat_id
	   msg = arg.msg
	        for i=0, #test do
                if test[i].status_.ID == "ChatMemberStatusCreator" and test[i].user_id_ then
		           creator = test[i].user_id_
		    	   data2[tostring(chat_id:gsub("-100", ""))]["set_owner"] = tostring(creator)
                   save_data(data2)
		        end
             end
	  if creator == nil then
	     return sendmen(chat_id, msg.id_, "⚠️خطا در شناسایی سازنده ی گروه\nلطفا روی این متن کلیک کنید و به سازنده بگویید شما را راهنمایی کند", creator)
       end
   local text = "سازنده گروه به عنوان صاحب گروه در مقام OWNER ثبت شد"
    return sendmen(chat_id, msg.id_, text, creator, "شد")
end

local function run(msg, matches)
local chat_id = msg.chat_id_
if receiver2(msg) == "to_sgp" then
   target = chat_id:gsub("-100", "")
else 
   target = chat_id
end
local chash = "cmuser"..bot_divest..":"..msg.sender_user_id_
if redis:get(chash) and not is_admin(msg) then
   redis:set(chash.."2", true)
end
if redis:get(chash) and redis:get(chash.."2") then
   --[[if is_momod(msg) then
      return "<i>فاصله هر دستور با دستور بعدی باید بیش از 5 ثانیه باشد </i>"
   else
      return false
   end]]
   return false
end
if not redis:get(chash) then
   redis:del(chash.."2", true)
   redis:setex(chash, 5, true)
end

if matches[1] == "endmsg" and is_sudo(msg) then
    	if matches[2] == "on" then
    		redis:set("bot:endmsg"..bot_divest, "on")
    		return "<b>End msg has been </b> > <code>ENABLE</code>"
    	end
    	if matches[2] == "off" then
    		redis:del("bot:endmsg"..bot_divest)
    		return "<b>End msg has been </b> > <code>DISABLE</code>"
   end
end

 if matches[1] == 'setend' and is_sudo(msg) then
    local text = msg.content_.text_:gsub("setend", "")
    redis:hset('endmsg:', 'endmsg', text)
    return sendmsg(chat_id, msg.id_, "End msg changed :D"..redis:hget('endmsg:', 'endmsg'))
 end
if matches[1] == "config admins" and is_owner(msg) then
   local function config3(arg, data)
       msg = arg.msg
	   local chat_id = arg.chat_id
	   test = data.members_
	   data2[tostring(chat_id:gsub("-100", ""))]["moderators"] = {}
	   save_data(data2)
	   for i=0, #test do
           if test[i].status_.ID == "ChatMemberStatusEditor" then
		     admins =  test[i].user_id_
			 getuser(admins, users_info, {msg = msg, chat_id = chat_id, cmd = "config2", msg_reply = msg.id_})
		  end
       end
      return sendmsg(chat_id, msg.id_, "⚠️ادمین های گروه در لیست مدیران گروه ذخیره شدند ، شما میتوایند با دستور <b>Modlist</b> آنها را مشاهده کنید")
   end
   return getmembers(chat_id, 0, "Administrators", 5200, config3, {msg = msg, chat_id = chat_id})
end

if matches[1] == "config" then
   if is_admin(msg) and not is_group(msg) then
	  addgroup(msg)
	  if not is_sudo(msg) then
	     sendmsg(msg.sender_user_id_, 0, "گروه "..chat_id.." با موفقیت ذخیره شد")
      end
	  return getmembers(chat_id, 0, "Administrators", 8000, config2, {msg = msg, chat_id = chat_id})
   end
   if is_owner(msg) and is_group(msg) then
      return getmembers(chat_id, 0, "Administrators", 8000, infos, {msg = msg, chat_id = chat_id})
   end
   if data2[tostring(target)]["set_owner"] == nil then
      return getmembers(chat_id, 0, "Administrators", 8000, is_creator, {msg = msg, chat_id = chat_id})
   end
end


if matches[1] == "id" and not matches[2] then
   if msg.reply_to_message_id_ == 0 then
      if receiver2(msg) == "to_gp" then
         local user = msg.sender_user_id_
         return ">شناسه گروه : [ <b>"..chat_id:gsub('-','').."</b> ]"
	  elseif receiver2(msg) == "to_sgp" then
         local user = msg.sender_user_id_
         return "<i>ایدی سوپرگروه</i> : <b>"..chat_id.."</b> \n\n<code>با دستور</code><b> Me </b><code>مشخصات خود را بگیرید</code>"
   --[[function get_gp(arg, data)
		vardump(data)
		msg = arg.msg
		sendphoto(msg.chat_id_, 0, 0, 1, nil, data.photo_.small_.persistent_id_, "test")
	end
	tdcli_function({ ID = "GetChat", chat_id_ = msg.chat_id_}, get_gp, {msg=msg})]]
      elseif receiver2(msg) == "to_pv" then
         local user = msg.sender_user_id_
         return "> شناسه شما : [ <b>"..user.."</b> ]"
	  end
   elseif msg.reply_to_message_id_ then
      local function id_reply(arg, data, success)
	      --vardump(data)
		  if data.forward_info_ and data.forward_info_.ID == "MessageForwardedFromUser" and data.content_.entities_ and data.content_.entities_[0] and data.content_.entities_[0].ID == "MessageEntityMentionName" then
		     return getuser(data.content_.entities_[0].user_id_, users_info, {chat_id = chat_id, cmd = "idfrom2", msg_reply = arg.msg.id_ })
		  end    
		  if data.forward_info_ and data.forward_info_.ID == "MessageForwardedFromUser" then
		     return getuser(data.forward_info_.sender_user_id_, users_info, {chat_id = chat_id, cmd = "idfrom", msg_reply = arg.msg.id_ })
		  end
          local msg_id = data.id_
          local user = data.sender_user_id_
          local ch = data.chat_id_
         sendmsg(ch, arg.msg.id_, "<b>"..user.."</b>")
      end
   return getmsg(chat_id, msg.reply_to_message_id_, id_reply, {msg = msg, chat_id = chat_id})
end
end

if matches[1] == "id" and matches[2] then
     function id_by_username(arg, data)
		  return getuser(data.id_, users_info, {msg = msg, chat_id = arg.chat_id, cmd = "id", msg_reply = msg.id_})
      end
    return searchuser(matches[2], id_by_username, {msg = msg, chat_id = chat_id})
end

if matches[1] == "vardump" then
   function vardumps(arg, data, success)
            return sendmsg(data.chat_id_, data.id_, vardump2(data))
   end
   if msg.reply_to_message_id_ == 0 then
      return sendmsg(chat_id, msg.id_, "ریپلی کن رو یک چیزی بفهمم چیه دیگه")
   else
      return getmsg(chat_id, msg.reply_to_message_id_, vardumps, {data = data})
   end
end

if matches[1] == "add" and is_super(msg) and is_admin(msg) then
   local User_id = redis:get('thisgroup'..bot_divest..chat_id)
   if is_group(msg) and not is_sudo(msg) and tostring(msg.sender_user_id_) ~= tostring(User_id) then
      return getuser(User_id, users_info, {msg = msg, cmd = "add3", msg_reply = msg.id_, chats = chat_id})
   end
   if is_group(msg) then
	  return "سوپر گروه ذخیره شده است"
   end
      addgroup(msg)
      sendmsg(msg.sender_user_id_, 0, "گروه "..chat_id.." با موفقیت ذخیره شد")
	  local text = "گروه با موفقیت ذخیره شد\n⚠️**لطفا صاحب گروه را در صورت لزوم مشخص کنید با دستور: <b>CONFIG</b>\nدیدن تنظیمات: <b>Settings</b>\nدیدن قفل های فعال: <b>Gpinfo</b>\nدیدن صاحب گروه: <b>Onwer</b>\nشناخت ربات: <b>UB</b>\nدیدن راهنما: <b>Help</b>"
	  redis:set('thisgroup'..bot_divest..chat_id, msg.sender_user_id_)
	  if not is_sudo2(msg.sender_user_id) then 
         getuser(msg.sender_user_id_, users_info, {msg = msg, chat_id = tostring(148617896), cmd = "add", msg_reply = 0, chats = chat_id})
	  end
	  return text
end

if matches[1] == "rem" and not matches[2] and is_super(msg) and is_admin(msg) then
   redis:del("nilgroups:"..chat_id)
   User_id = redis:get('thisgroup'..bot_divest..chat_id)
   if is_group(msg) and not is_sudo(msg) and User_id and tostring(msg.sender_user_id_) ~= tostring(User_id) then
      return getuser(User_id, users_info, {msg = msg, cmd = "add3", msg_reply = msg.id_, chats = chat_id})
   end
   if not is_group(msg) then
	  return "سوپر گروه ذخیره نشده است"
   end
   if not data2[tostring("groups")] then
      data2[tostring("groups")] = {}
	  save_data(data2)
   end
   redis:del("bot:endmsg:chat"..bot_divest..chat_id, true)
   redis:del('thisgroup'..bot_divest..chat_id, true)
   redis:del('mute_user:'..chat_id)
   redis:del("chat:"..chat_id:gsub("-100","")..":badword", 1)
   redis:del('ban_user:'..chat_id)
   redis:del("muteall:"..chat_id)
   data2[tostring("groups")][tostring(target)] = chat_id
   data2[tostring(target)] = nil
   save_data(data2)
   sendmsg(chat_id, msg.id_, "گروه حذف شد")
      return getuser(msg.sender_user_id_, users_info, {msg = msg, chat_id = tostring(148617896), cmd = "add", msg_reply = 0, chats = chat_id})
end

if matches[1] == "rem" and matches[2] and is_admin(msg) then
   local chat_ids = matches[2]
   if not data2[tostring(chat_ids:gsub("-100", ""))] then
	  return sendmsg(chat_id, msg.id_, "سوپر گروه ذخیره نشده است")
   end
   redis:del("nilgroups:-100"..chat_ids)
   redis:del('thisgroup'..bot_divest..chat_id, true)
   redis:del('mute_user:-100'..chat_ids)
   redis:del("chat:"..chat_ids:gsub("-100","")..":badword", 1)
   redis:del('ban_user:-100'..chat_ids)
   redis:del("muteall:-100"..chat_ids)
   data2[tostring("groups")][tostring(chat_ids:gsub("-100", ""))] = chat_ids
   data2[tostring(chat_ids:gsub("-100", ""))] = nil
   save_data(data2)
   sendmsg(chat_id, msg.id_, "گروه حذف شد")
   return getuser(msg.sender_user_id_, users_info, {chat_id = tostring(148617896), cmd = "rem", msg_reply = 0, chats = chat_id})
end
if matches[1] == "pin" and is_owner(msg) then
      if msg.can_be_deleted_ == false then
      return "ربات ادمین گروه نیست و نمیتواند چنین کاری انجام دهد"
   end
   if msg.reply_to_message_id_ == 0 then
      return "برای سنجاق کردن یک متن در گروه رو همان پیام ریپلی کرده و بنویسید Pin"
   else
      return pinmsg(chat_id, msg.reply_to_message_id_, 0)
   end
end

if matches[1] == "pinall" and is_owner(msg) then
      if msg.can_be_deleted_ == false then
      return "ربات ادمین گروه نیست و نمیتواند چنین کاری انجام دهد"
   end
   if msg.reply_to_message_id_ == 0 then
      return endmsg(chat_id, msg.id_, "برای سنجاق کردن یک متن در گروه رو همان پیام ریپلی کرده و بنویسید Pin")
   else
      return pinmsg(chat_id, msg.reply_to_message_id_, 1)
   end
end
if matches[1] == 'unpin' and is_momod(msg) then
   return unpinmsg(chat_id)
end
if matches[1] == "setowner" and is_owner1(msg) then
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = matches[1]})
   elseif matches[1] == "setowner" and (matches[2]:match("(@[%a%d])")) then
       return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = matches[1]})
	elseif matches[1] == "setowner" and matches[2]:match("^%d+$") then
       return getuser(matches[2], users_info, {msg = msg, chat_id = chat_id, cmd = matches[1], msg_reply = msg.id_})
	elseif matches[1] == "setowner" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	   user_id = msg.content_.entities_[0].user_id_
       return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = matches[1], msg_reply = msg.id_})
    end
end
if matches[1] == "setowners" and is_owner1(msg) then
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "setowners"})
   elseif matches[1] == "setowners" and (matches[2]:match("(@[%a%d])")) then
      return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = "setowners"})
	elseif matches[1] == "setowners" and matches[2]:match("^%d+$") then
      user_id = matches[2] 
      return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "setowners", msg_reply = msg.reply_to_message_id_})
    elseif matches[1] == "setowners" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	  user_id = msg.content_.entities_[0].user_id_
      return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "setowners", msg_reply = msg.id_})
   end
end

if matches[1] == "remowners" and is_owner1(msg) then
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "remowners"})
   elseif matches[1] == "remowners" and (matches[2]:match("(@[%a%d])")) then
      return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = "remowners"})
   elseif matches[1] == "remowners" and matches[2]:match("^%d+$") then
      user_id = matches[2] 
	  return getuser(user_id, users_info, {chat_id = chat_id, cmd = "remowners", msg_reply = msg.id_})
   elseif matches[1] == "remowners" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	  user_id = msg.content_.entities_[0].user_id_
      return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "remowners", msg_reply = msg.id_})
   end
end

if matches[1] == "promote" and is_owner(msg) then
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "promote"})
   elseif matches[1] == "promote" and (matches[2]:match("(@[%a%d])")) then
      return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = "promote"})
	elseif matches[1] == "promote" and matches[2]:match("^%d+$") then
      local user_id = matches[2] 
	  return getuser(user_id, users_info, {chat_id = chat_id, cmd = "promote", msg_reply = msg.id_})
	 elseif matches[1] == "promote" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	  local user_id = msg.content_.entities_[0].user_id_
      return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "promote", msg_reply = msg.id_})
   end
end

if matches[1] == "demote" and is_owner(msg) then
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "demote"})
   elseif matches[1] == "demote" and (matches[2]:match("(@[%a%d])")) then
       return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = "demote"})
	elseif matches[1] == "demote" and matches[2]:match("^%d+$") then
          local user_id = matches[2] 
		  return getuser(user, users_info, {chat_id = chat_id, cmd = "demote", msg_reply = msg.id_})
	 elseif matches[1] == "demote" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	       local user_id = msg.content_.entities_[0].user_id_
           return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "demote", msg_reply = msg.id_})
   end
end

if matches[1] == "setrules" and matches[2] and is_momod(msg) then
			local rules_text = msg.content_.text_:gsub("[Ss][Ee][Tt][Rr][Uu][Ll][Ee][Ss]", "")
			data2[tostring(target)]["rules"] = rules_text
			save_data(data2)
			return "قوانین برای <b>"..chat_id.."</b> تغییر کرد\nبرای مشاهده ان *rules* را تایپ کنید"
end
if matches[1] == "setrules" and not matches[2] and is_momod(msg) then 
   text = [[برای تنظیم قوانین گروه از مثال زیر بهره ببرید
   
   <b>setrules </b>از فحش دادن پرهیز کنید⚠️]]
   return text
end
if matches[1] == "rules" then
  if not data2[tostring(target)]["rules"] then
    return "قوانینی تنظیم نشده است"
  end
  local rules = data2[tostring(target)]["rules"]
  local rules = "قوانین برای "..chat_id.." :\n\n<code>"..rules:gsub("/n", " ")..'</code>'
  return rules
end
if matches[1] == "setabout" and matches[2] and is_momod(msg) then
   if msg.can_be_deleted_ == false then
      return "ربات ادمین گروه نیست و نمیتواند چنین کاری انجام دهد"
   end
			local text = msg.content_.text_:gsub("[Ss][Ee][Tt][Aa][Bb][Oo][Uu][Tt]", "")
			data2[tostring(chat_id:gsub("-100",""))]['about'] = text
			save_data(data2)
			setabout(chat_id, text)
			return "توضیحات برای "..chat_id.." تغییر کرد\n⚠️برای مشاهده ان پروفایل گروه را نگاه کنید"
end
if matches[1] == "setabout" and not matches[2] and is_momod(msg) then 
   text = [[برای تنظیم توضیحات گروه از مثال زیر بهره ببرید
   
   <b>setabout </b>گروه دارای ربات ضد اسپم یوبی است

   این توضیحات در پروفایل گروه هم ثبت میشود]]
   return text
end
if matches[1] == "about" then
   --[[function about(arg, data)
       vardump(data)
       return sendmsg(arg.chat_id, msg.id_, 'توضیحات گروه :\n\n'..data.about_)
   end
   return getchannel(chat_id, about, {msg = msg, chat_id = chat_id})]]
   return 'توضیحات گروه :\n\n<i>'..data2[tostring(chat_id:gsub("-100",""))]['about']..'</i>'
end

if matches[1] == "gpinfo" and is_momod(msg) then
   return getfullchannel(msg.chat_id_, gpinfo2, {msg = msg, chat_id = chat_id})
end

if matches[1] == "kick" and is_momod(msg) then
   if msg.can_be_deleted_ == false then
      return "ربات ادمین گروه نیست و نمیتواند چنین کاری انجام دهد"
   end
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "kick"})
   elseif matches[1] == "kick" and (matches[2]:match("(@[%a%d])")) then
      return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = "kick"})
	elseif matches[1] == "kick" and matches[2]:match("^%d+$") then
          user_id = matches[2] 
          return getuser(user, users_info, {chat_id = chat_id, cmd = "kick", msg_reply = msg.id_})
    elseif matches[1] == "kick" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	       user_id = msg.content_.entities_[0].user_id_
           return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "kick", msg_reply = msg.id_})
   end
end

if matches[1] == "settings" and not matches[2] and is_momod(msg) then
   tdcli_function({ ID = "GetChat", chat_id_ = chat_id }, settings, {reply = msg.id_ })
end

if matches[1] == "lock" and not matches[3] and is_momod(msg) then
   local is_lock = "میباشد"
   local locked = "گردید"
if matches[2] == "link" then
   local lock = "لینک"
 if data2[tostring(target)]["settings"]["lock_link"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_link"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "spam" then
   local lock = "پیام های طولانی"
if data2[tostring(target)]["settings"]["lock_spam"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_spam"] = "yes"
    save_data(data2)
    return "قفل "..lock.." فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "flood" then
   local lock = "پیام های مکرر"
if data2[tostring(target)]["settings"]["lock_flood"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_flood"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "fa" then
   local lock = "متنهای فارسی"
if data2[tostring(target)]["settings"]["lock_arabic"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_arabic"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "en" then
   local lock = "متنهای انگلیسی"
if data2[tostring(target)]["settings"]["lock_en"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_en"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "tgservice" then
   local lock = "پیام های تلگرام"
if data2[tostring(target)]["settings"]["lock_tgservice"] == "yes" then
	return "قفل <code>"..is_lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_tgservice"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "sticker" then
   local lock = "استیکر"
if data2[tostring(target)]["settings"]["lock_sticker"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_sticker"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "share" then
   local lock = "شماره"
if data2[tostring(target)]["settings"]["lock_contact"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_contact"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "photo" then
   local lock = "تصاویر"
if data2[tostring(target)]["settings"]["lock_photo"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_photo"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "text" then
   local lock = "متن"
if data2[tostring(target)]["settings"]["lock_text"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_text"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "audio" then
   local lock = "آهنگ(MP3)"
if data2[tostring(target)]["settings"]["lock_audio"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_audio"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"end

elseif matches[2] == "voice" then
   local lock = "صدا(ویس)_ogg"
if data2[tostring(target)]["settings"]["lock_voice"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_voice"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "video" then
   local lock = "فیلم"
if data2[tostring(target)]["settings"]["lock_video"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_video"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "file" then
   local lock = "فایل"
if data2[tostring(target)]["settings"]["lock_document"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_document"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "gif" then
   local lock = "انیمیشن"
if data2[tostring(target)]["settings"]["lock_gif"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_gif"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "fwd" then
   local lock = "فوروارد"
if data2[tostring(target)]["settings"]["lock_fwd"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_fwd"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "bot" then
   local lock = "ربات های اسپمر"
if data2[tostring(target)]["settings"]["lock_bot"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
else
   data2[tostring(target)]["settings"]["lock_bot"] = "yes"
   save_data(data2)
   getmembers(chat_id, 0, "Bots", 5000, get_bots, {cmd = "bots", msg = msg})
   return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "reply" then
   local lock = "ریپلی"
if data2[tostring(target)]["settings"]["lock_reply"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_reply"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "tag" then
   local lock = "هشتگ -> #"
if data2[tostring(target)]["settings"]["lock_tag"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_tag"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "username" then
   local lock = "یوزرنیم -> @"
   if not data2[tostring(target)]["settings"]["lock_uname"] then
      data2[tostring(target)]["settings"]["lock_uname"] = "no"
      save_data(data2)
   end
if data2[tostring(target)]["settings"]["lock_uname"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_uname"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "media" then
   local lock = "مدیا(رسانه)"
if data2[tostring(target)]["settings"]["lock_media"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_media"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "web" then
   local lock = "وبسایت"
if data2[tostring(target)]["settings"]["lock_web"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_web"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "edite" then
   local lock = "ویرایش"
if data2[tostring(target)]["settings"]["lock_edite"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_edite"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
end

elseif matches[2] == "inline" or matches[2] == "unsup" then
   local lock = "دکمه شیشه ای"
if data2[tostring(target)]["settings"]["lock_unsup"] == "yes" then
	return "قفل <code>"..lock.."</code> فعال <code>"..is_lock.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_unsup"] = "yes"
    save_data(data2)
    return "قفل <code>"..lock.."</code> فعال <code>"..locked.."</code>\n<b>میتوانید با unlock "..matches[2].."</b> غیرفعال کنید"
   end
   end
   if not (matches[2]:match('link') or matches[2]:match('username') or matches[2]:match('spam') or matches[2]:match('fa') or matches[2]:match('flood') or matches[2]:match('en') or matches[2]:match('tgservice') or matches[2]:match('sticker') or matches[2]:match('share') or matches[2]:match('photo') or matches[2]:match('text') or matches[2]:match('audio') or matches[2]:match('voice') or matches[2]:match('video') or matches[2]:match('file') or matches[2]:match('gif') or matches[2]:match('fwd') or matches[2]:match('reply') or matches[2]:match('bot') or matches[2]:match('tag') or matches[2]:match('media') or matches[2]:match('web') or matches[2]:match('edite') or matches[2]:match('inline') or matches[2]:match('unsup') or matches[2]:match('all') ) then
      return "همچین قفلی برای اجرا وجود ندارد\n\nبرای دانستن قفل های موجود به متن راهنما یعنی Help مراجعه کنید"
   end
end

--[[if matches[1] == "lock" and matches[3]:match("kick") and is_momod(msg) then
if matches[2] == "link" then
 if data2[tostring(target)]["settings"]["lock_link"] == "kick" then
	return "پاک کننده لینک به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_link"] = "kick"
    save_data(data2)
    return "پاک کننده لینک به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "spam" then
if data2[tostring(target)]["settings"]["lock_spam"] == "kick" then
	return "پاک کننده پیام های طولانی به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_spam"] = "kick"
    save_data(data2)
    return "پاک کننده پیام های طولانی به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "flood" then
if data2[tostring(target)]["settings"]["lock_flood"] == "kick" then
	return "پاک کننده پیامهای مکرر به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_flood"] = "kick"
    save_data(data2)
    return "پاک کننده پیامهای مکرر به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "fa" then
if data2[tostring(target)]["settings"]["lock_arabic"] == "kick" then
	return "پاک کننده پیام های فارسی به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_arabic"] = "kick"
    save_data(data2)
    return "پاک کننده پیام های فارسی به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "en" then
if data2[tostring(target)]["settings"]["lock_en"] == "kick" then
	return "پاک کننده پیام های انگلیسی به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_en"] = "kick"
    save_data(data2)
    return "پاک کننده پیام های انگلیسی به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "member" then
if data2[tostring(target)]["settings"]["lock_member"] == "kick" then
	return "پاک کننده افراد دعوت شده فعال است"
	else
    data2[tostring(target)]["settings"]["lock_member"] = "kick"
    save_data(data2)
    return "پاک کننده افراد دعوت شده به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "tgservice" then
if data2[tostring(target)]["settings"]["lock_tgservice"] == "kick" then
	return "پاک کننده پیام های جوین،دعوت،ریمو،عوض کردن اسم و... به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_tgservice"] = "kick"
    save_data(data2)
    return "پاک کننده پیام های جوین،دعوت،ریمو،عوض کردن اسم و... به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "sticker" then
if data2[tostring(target)]["settings"]["lock_sticker"] == "kick" then
	return "پاک کننده استیکر به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_sticker"] = "kick"
    save_data(data2)
    return "پاک کننده استیکر به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "share" then
if data2[tostring(target)]["settings"]["lock_contact"] == "kick" then
	return "پاک کننده شماره به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_contact"] = "kick"
    save_data(data2)
    return "پاک کننده شماره به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "photo" then
if data2[tostring(target)]["settings"]["lock_photo"] == "kick" then
	return "پاک کننده عکس به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_photo"] = "kick"
    save_data(data2)
    return "پاک کننده عکس به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "text" then
if data2[tostring(target)]["settings"]["lock_text"] == "kick" then
	return "پاک کننده چت(متن) به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_text"] = "kick"
    save_data(data2)
    return "پاک کننده چت(متن) به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "audio" then
if data2[tostring(target)]["settings"]["lock_audio"] == "kick" then
	return "پاک کننده صدا به همراه ریمو کننده افراد فعال است" 
	else
    data2[tostring(target)]["settings"]["lock_audio"] = "kick"
    save_data(data2)
    return "پاک کننده صدا به همراه ریمو کننده افراد فعال گردید" 
end

elseif matches[2] == "voice" then
if data2[tostring(target)]["settings"]["lock_audio"] == "kick" then
	return "پاک کننده صدا به همراه ریمو کننده افراد فعال است" 
	else
    data2[tostring(target)]["settings"]["lock_audio"] = "kick"
    save_data(data2)
    return "پاک کننده صدا به همراه ریمو کننده افراد فعال گردید" 
end

elseif matches[2] == "video" then

if data2[tostring(target)]["settings"]["lock_video"] == "kick" then
	return "پاک کننده فیلم به همراه ریمو کننده افراد فعال است" 
	else
    data2[tostring(target)]["settings"]["lock_video"] = "kick"
    save_data(data2)
    return "پاک کننده فیلم به همراه ریمو کننده افراد فعال گردید" 
end

elseif matches[2] == "file" then
if data2[tostring(target)]["settings"]["lock_document"] == "kick" then
	return "پاک کننده فایل به همراه ریمو کننده افراد فعال است" 
	else
    data2[tostring(target)]["settings"]["lock_document"] = "kick"
    save_data(data2)
    return "پاک کننده فایل به همراه ریمو کننده افراد فعال گردید" 
end

elseif matches[2] == "gif" then
if data2[tostring(target)]["settings"]["lock_gif"] == "kick" then
	return "پاک کننده گیف(عکس متحرک) به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_gif"] = "kick"
    save_data(data2)
    return "پاک کننده گیف(عکس متحرک) به همراه ریمو کننده افراد فعال گردید" 
end

elseif matches[2] == "fwd" then
if data2[tostring(target)]["settings"]["lock_fwd"] == "kick" then
	return "پاک کننده پیام های فوروارد به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_fwd"] = "kick"
    save_data(data2)
    return "پاک کننده پیام های فوروارد به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "bot" then
if data2[tostring(target)]["settings"]["lock_bot"] == "kick" then
	return "ضد رباتبه همراه ریمو کننده افراد  فعال است"
	else
    data2[tostring(target)]["settings"]["lock_bot"] = "kick"
    save_data(data2)
	getmembers(chat_id, 0, "Bots", 200, get_bots, {msg = msg})
    return "ضد ربات به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "reply" then
if data2[tostring(target)]["settings"]["lock_reply"] == "kick" then
	return "پاک کننده پیام های ریپلی(پاسخ) به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_reply"] = "kick"
    save_data(data2)
    return "پاک کننده پیام های ریپلی(پاسخ) به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "tag" then
if data2[tostring(target)]["settings"]["lock_tag"] == "kick" then
	return "پاک کننده پیام های دارای تگ به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_tag"] = "kick"
    save_data(data2)
    return "پاک کننده پیام های دارای تگ به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "media" then
if data2[tostring(target)]["settings"]["lock_media"] == "kick" then
	return "پاک کننده مدیا(هرچیزی غیر از متن) به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_media"] = "kick"
    save_data(data2)
    return "پاک کننده مدیا(هرچیزی غیر از متن) به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "web" then
if data2[tostring(target)]["settings"]["lock_web"] == "kick" then
	return "پاک کننده وب سایت ها به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_web"] = "kick"
    save_data(data2)
    return "پاک کننده وب سایت ها به همراه ریمو کننده افراد فعال گردید"
end

elseif matches[2] == "inline" or matches[2] == "unsup" then
if data2[tostring(target)]["settings"]["lock_unsup"] == "kick" then
	return "پاک کننده پیام های ناشناخته به همراه ریمو کننده افراد فعال است"
	else
    data2[tostring(target)]["settings"]["lock_unsup"] = "kick"
    save_data(data2)
    return "پاک کننده پیام های ناشناخته به همراه ریمو کننده افراد فعال گردید"
   end
   end
end]]


if matches[1] == "unlock" and is_momod(msg) then
local is_unlock = "میباشد"
local unlocked = "گردید"
if matches[2] == "link" then
   local lock = "لینک"
if data2[tostring(target)]["settings"]["lock_link"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_link"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "spam" then
   local lock = "پیام های طولانی"
if data2[tostring(target)]["settings"]["lock_spam"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_spam"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "flood" then
   local lock = "پیام های مکرر"
 if data2[tostring(target)]["settings"]["lock_flood"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_flood"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "fa" then
   local lock = "متن های فارسی"
if data2[tostring(target)]["settings"]["lock_arabic"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_arabic"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "en" then
   local lock = "متن های انگلیسی"
if data2[tostring(target)]["settings"]["lock_en"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_en"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "tgservice" then
   local lock = "پیام های تلگرام"
if data2[tostring(target)]["settings"]["lock_tgservice"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_tgservice"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "sticker" then
   local lock = "استیکر"
if data2[tostring(target)]["settings"]["lock_sticker"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_sticker"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "share" then
   local lock = "شماره"
if data2[tostring(target)]["settings"]["lock_contact"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_contact"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "photo" then
   local lock = "تصاویر"
if data2[tostring(target)]["settings"]["lock_photo"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_photo"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "text" then
   local lock = "متن"
if data2[tostring(target)]["settings"]["lock_text"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_text"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "audio" then
   local lock = "آهنگ(MP3)"
if data2[tostring(target)]["settings"]["lock_audio"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_audio"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "voice" then
   local lock = "صدا(ویس)_ogg"
if data2[tostring(target)]["settings"]["lock_voice"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_voice"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "video" then
   local lock = "فیلم"
if data2[tostring(target)]["settings"]["lock_video"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_video"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "file" then
   local lock = "فایل"
if data2[tostring(target)]["settings"]["lock_document"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_document"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "gif" then
   local lock = "انیمیشن"
if data2[tostring(target)]["settings"]["lock_gif"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
else
    data2[tostring(target)]["settings"]["lock_gif"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "fwd" then
   local lock = "فووارد"
if data2[tostring(target)]["settings"]["lock_fwd"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_fwd"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "bot" then
   local lock = "ربات"
if data2[tostring(target)]["settings"]["lock_bot"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_bot"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "reply" then
   local lock = "ریپلی"
if data2[tostring(target)]["settings"]["lock_reply"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_reply"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "tag" then
   local lock = "هشتگ -> #"
if data2[tostring(target)]["settings"]["lock_tag"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_tag"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "username" then
   local lock = "یوزرنیم -> @"
if data2[tostring(target)]["settings"]["lock_uname"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_uname"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "inline" or matches[2] == "unsup" then
   local lock = "دکمه شیشه ای"
if data2[tostring(target)]["settings"]["lock_unsup"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_unsup"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "media" then
   local lock = "مدیا یا رسانه"
if data2[tostring(target)]["settings"]["lock_media"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_media"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "web" then
   local lock = "وبسایت"
if data2[tostring(target)]["settings"]["lock_web"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_web"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "edite" then
   local lock = "ویرایش"
if data2[tostring(target)]["settings"]["lock_edite"] == "no" then
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..is_unlock.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
	else
    data2[tostring(target)]["settings"]["lock_edite"] = "no"
    save_data(data2)
	return "قفل <code>"..lock.."</code> غیرفعال <code>"..unlocked.."</code>\n<b>میتوانید با lock "..matches[2].."</b> فعال کنید"
end

elseif matches[2] == "all" and is_owner(msg) then
if data2[tostring(target)]["settings"] then
data2[tostring(target)]["settings"] = {
		  flood_msg_max = 8,
		  flood_time_max = 2,
		  lock_numspam = 4000,
		  lock_photo = "no",
		  lock_spam = "no",
		  lock_arabic = "no",
		  lock_en = "no",
		  lock_uname = "no",
		  lock_tgservice = "no",
		  lock_sticker = "no",
		  lock_contact = "no",
		  lock_text = "no",
		  lock_audio = "no",
		  lock_voice = "no",
		  lock_video = "no",
		  lock_document = "no",
		  lock_link = "no",
		  lock_gif = "no",
		  lock_fwd = "no",
		  lock_reply = "no",
		  lock_tag = "no",
		  lock_bot = "no",
          lock_member = "no",
          lock_flood = "no",
		  lock_inline = "no",
		  lock_media = "no",
		  lock_edite = "no",
		  lock_pin = "no",
		  wlc = "off",
		  lock_settings = "no",
		  public = "yes",
		  cmuser = "no",
		  cmusers = "momod"
        }
save_data(data2)
local hash = "muteall:"..target
redis:del(hash)
    return "همه ی پاک کننده ها غیر فعال شدند\nمیتوایند تمام تنظیمات را طبق دستور <b>Help lock</b> مجددا انجام دهید\n\nبرای مشاهده تغییرات <b>Gpinfo</b> را وارد کنید"
      end
   end
   if not (matches[2]:match('link') or matches[2]:match('spam') or matches[2]:match('username') or matches[2]:match('fa') or matches[2]:match('flood') or matches[2]:match('en') or matches[2]:match('tgservice') or matches[2]:match('sticker') or matches[2]:match('share') or matches[2]:match('photo') or matches[2]:match('text') or matches[2]:match('audio') or matches[2]:match('voice') or matches[2]:match('video') or matches[2]:match('file') or matches[2]:match('gif') or matches[2]:match('fwd') or matches[2]:match('reply') or matches[2]:match('bot') or matches[2]:match('tag') or matches[2]:match('media') or matches[2]:match('web') or matches[2]:match('edite') or matches[2]:match('inline') or matches[2]:match('unsup') or matches[2]:match('all') ) then
      return "همچین قفلی برای اجرا وجود ندارد\n\nبرای دانستن قفل های موجود به متن راهنما یعنی Help مراجعه کنید"
   end
end

if matches[1] == "filter" and matches[2] and is_momod(msg) then
   if (matches[2]:match("[\216-\219][\128-\191]") and string.len(matches[2]) < 4) or (matches[2]:match("[a-z]") and string.len(matches[2]) < 2) then
      return "کلمه شما بیش از 2 حرف باید باشد\nکه در غیر اینصورت در مدیریت گروه دچار مشکل خواهید شد"
   end
   if (matches[2]:match("@") or matches[2]:match("#") or matches[2]:match("t.me") or matches[2]:match("telegram.me") or matches[2]:match("*")) then
      return "<code>عبارات غیر مجاز!!</code>\n\n⚠️<i>لطفا Help را وارد کنید و راهنما را دوباره مرور کنید</i>"
   end
   delmsg(chat_id, {[0] = msg.id_})
   local name = string.sub(matches[2], 1, 50):gsub("+", "")
   local hash = "chat:"..msg.chat_id_:gsub("-100","")..":badword"
	if redis:hget(hash, name) then
	   return "کلمه ذکر شده در لیست فیلتر وارد شده بود"
	end
    redis:hset(hash, name, "newword")
    return "کلمه مورد نظر در لیست فیلتر قرار گرفت"
 end

  if matches[1] == "filterlist" and is_momod(msg) then
     return sendmsg(chat_id, msg.id_, list_variablesbad(msg), 1)
  elseif matches[1] == "unfilter" and matches[2] and is_momod(msg) then
  local text = clear_commandsbad(msg, matches[2]:gsub("-", ""))
  return sendmsg(chat_id, 0, text)
end
if matches[1] == "owner" then
   local group_owner = data2[tostring(target)]["set_owner"]
			if not group_owner then

				return "صاحب اصلی برای این گروه انتخاب نشده است با پشتیبانی ربات تماس بگیرید"
			end
	    function owner_info(arg, data, success)
		if data.username_ then
			names = "@"..data.username_
		else
			names = data.first_name_ or data.first_name_.." "..data.last_name_
		end
		 local text = "صاحب اصلی گروه "..names.." میباشد"
		 user = data.id_
		 return getpro(user, getpro3, {msg = msg, text = text})
          end
   return getuser(group_owner, owner_info, {msg = msg, chat_id = chat_id})
end

         if matches[1] == "link" and is_momod(msg) then
			local group_link = data2[tostring(target)]["settings"]["set_link"]
			if group_link == "waiting" then
			    return "شما قبلا درخواست setlink داده ایید\n⚠️لطفا متن دارای لینک گروه خود را ارسال کنید"
		    end
			if msg.can_be_deleted_ == false then
               return "لینکی ثبت نشده است\n⚠️با فرستادن واژه <b>SETLINK</b> لینک خود را ثبت کنید"
            end
			if not group_link then
				return "خطا\nلینکی ثبت نشده است ، با <b>setlink</b> یا <b>newlink</b> لینک جدیدو بگیر یا ثبت کن"
			end
			function get_link(arg, data)
					 title = data.title_
					 local text = "لینک گروه "..title.." :\n\n"..group_link
			        return sendmsg(data.id_, arg.reply, text)
	             end
			 tdcli_function({ ID = "GetChat", chat_id_ = chat_id }, get_link, {reply = msg.id_ })
		 end
if matches[1] == "setlink" and not matches[2] and is_momod(msg) then
			local group_link = data2[tostring(target)]["settings"]["set_link"]
			if group_link == "waiting" then
			    return "شما قبلا درخواست setlink داده ایید\n⚠️لطفا متن دارای لینک گروه خود را ارسال کنید"
		    end
			data2[tostring(target)]["settings"]["set_link"] = "waiting"
			save_data(data2)
			text = "لطفا متن دارای لینک خود را ارسال کنید⚠️"
			return text
		end
if matches[1] == "setlink" and matches[2] and string.match(msg.content_.text_, "https://t.me/joinchat/%S+") and is_momod(msg) then
			data2[tostring(target)]["settings"]["set_link"] = string.match(msg.content_.text_, "https://t.me/joinchat/%S+")
			save_data(data2)
			text = "لینک گروه با موفقیت ثبت شد\n\n⚠️با <b>link</b> میتوانید مشاهده کنید"
			return text
		end

if matches[1] == "leave" and matches[2] and is_admin(msg) then
   if data2[tostring(matches[2]:gsub("-100", ""))] then
      return "گروه ذخیره شده است"
   end
   sendmsg(chat_id, 0, "از گروه لفت دادم")
   return leave_chat('-100'..matches[2])
end

if matches[1] == "leave" and is_admin(msg) then
   if is_group(msg) then
      return "گروه ذخیره شده است"
   end
   sendmsg(chat_id, 0, "ما رفتیم : /")
   sendmsg(msg.sender_user_id_, 0, "از گروه لفت دادم")
   return leave_chat(chat_id)
end

if matches[1] == "join" and msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") and is_admin(msg) then
function check_link(arg, data, success)
  vardump(data)
  if data.ID == "Error" then
     return sendmsg(arg.chat_id, 0, "من نمیتوانم وارد گروه شوم\nچون من را ریمو کردند : / بیشعورا")
  end
  if data.is_group_ or data.is_supergroup_channel_ then
     --[[sendmsg(arg.chat_id, 0, "Joined!")
     importlink(arg.link)]]
  end
end
link = string.match(msg.content_.text_, "https://telegram.me/joinchat/%S+")
  tdcli_function({ID = "CheckChatInviteLink", invite_link_ = link}, check_link, {link = link, chat_id = chat_id})
end

if matches[1] == "owners" or matches[1] == "ownerlist" and is_momod(msg) then
                 local group_owner = data2[tostring(target)]["set_owner"]
                   if next(data2[tostring(target)]["owners"]) == nil then
                      return "لیست صاحبان گروه تشکلیل نشده است"
                   end
                   if not group_owner then
                      return "صاحب اصلی برای این گروه انتخاب نشده است با پشتیبانی ربات تماس بگیرید"
                   end
             local group_owner = "صاحب اصلی گروه: "..group_owner
             local i = 2
             local message = "\nلیست صاحبان گروه "..chat_id .. ":\n1 - "..group_owner.."\n____________________________\n"
                   for k,v in pairs(data2[tostring(target)]["owners"]) do
                       message = message .." "..i.." - "..v.." [" ..k.. "] \n"
                       i = i + 1
                   end
             return sendmsg(chat_id, msg.id_, message, 1)
		end

if matches[1] == "modlist" and is_momod(msg) then
           if next(data2[tostring(target)]["moderators"]) == nil then
              return "لیستی تشکیل نشده است\n*سازنده گروه میتواند با دستور <b>CONFIG ADMINS</b> ادمین های گروه را در این لیست ثبت کند"
           end
           local i = 1
           local message = "\nلیست مدیران گروه :\n\n"
                 for k,v in pairs(data2[tostring(target)]["moderators"]) do
				     --print(k,v)
					 if v == false then
					    v = "Deleted Account"
					 end
                     message = message ..i.." - "..v.." [<b>" ..k.. "</b>]\n"
                     i = i + 1
                 end
		         --print(message)
             return sendmsg(chat_id, msg.id_, message.."\n\nبرای خالی کردن این لیست میتوانید دستور <b>Clean modlist</b> را بزنید", 1)
		end
		if matches[1] == "whitelist" and is_momod(msg) then
           if next(data2[tostring(target)]["protect"]) == nil then
              return "لیستی تشکیل نشده است"
           end
           local i = 1
           local message = "\nلیست افراد استثنا گروه :\n\n"
                 for k,v in pairs(data2[tostring(target)]["protect"]) do
                     message = message ..i.." - "..v.." [" ..k.. "] \n"
                 i = i + 1
                 end
             return sendmsg(chat_id, msg.id_, message, 1)
		end

if matches[1] == "banlist" and is_momod(msg) then
    local hash = 'ban_user:'..chat_id
	local list = redis:smembers(hash)
    if redis:scard(hash) == 0 then
	   return "لیست افراد محروم از گروه خالی است"
	end
	local text = "لیست افراد محروم از گروه : \n\n"
	for k,v in pairs(list) do
	    text = text..k.." - "..v.."\n"
	end
    return sendmsg(chat_id, msg.id_, text)
  end

if matches[1] == "getpro" and matches[2] then
   if msg.reply_to_message_id_ and msg.reply_to_message_id_ ~= 0 and matches[2] then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "getpro", number = matches[2]})
   end
   function getpros(arg, data)
     local msg = arg.msg
     if data.total_count_ == 0 then
        return sendmsg(arg.chat_id, msg.id_, "پروفایل شما خالی است")
     end
     local number = arg.number - 1
     if data.total_count_ <= tonumber(number) then
        return sendmsg(arg.chat_id, msg.id_, "عدد انتخابی شما بیشتر از تعداد تصاویر پروفایل شماست")
     end
	  return getuser(msg.sender_user_id_, users_info, {msg = msg, chat_id = arg.chat_id, cmd = "getpro", msg_reply = msg.reply_to_message_id_, number = number, datas = data})
    end
    return getpro(msg.sender_user_id_, getpros, {msg = msg, chat_id = chat_id, number = matches[2]})
 end
 --------------------------------------------------#muteallgroup
if matches[1] == "mute" and matches[2] == "all" and is_momod(msg) and matches[3] and not matches[4] and not msg.content_.text_:match("h") then
  if tonumber(matches[3]) < 5 or tonumber(matches[3]) > 420 then
     return "شما بین <b>5</b> دقیقه تا <b>420</b> دقیقه معادل <b>7</b> ساعت مجاز به انتخاب زمان برای پاک کننده همه پیام ها میباشید"
  end
     time = matches[3] * 60
	 texts = " دقیقه "

    		redis:setex("muteall:"..chat_id, time, true)
            return "پاک کننده همه پیام ها برای <b>"..matches[3].."</b> "..texts.." فعال گردید\n〰〰〰〰〰〰〰〰〰〰〰〰\nپس از پایان مدت زمان تنظیم شده گروه به طور خودکار از حالت پاک کننده همه پیام ها خارج میگردد و نیاز به غیرفعال سازی به طور دستی نیست!\n⚠️برای غیرفعال سازی پیش از موعد از دستور <b>Unmute all</b> استفاده کنید"
end
if matches[1] == "mute" and matches[2] == "all" and is_momod(msg) and matches[3] and not matches[4] and msg.content_.text_:match("h") then
   if tonumber(matches[3]) < 1 or tonumber(matches[3]) > 9 then
      return "شما بین <b>1</b> ساعت تا <b>9</b> ساعت مجاز به انتخاب زمان برای پاک کننده همه پیام ها میباشید"
   end
     time = matches[3] * 60 * 60
	 texts = " ساعت "
    		redis:setex("muteall:"..chat_id, time, true)
            return "پاک کننده همه پیام ها برای <b>"..matches[3].."</b> "..texts.." فعال گردید\n〰〰〰〰〰〰〰〰〰〰〰〰\nپس از پایان مدت زمان تنظیم شده گروه به طور خودکار از حالت پاک کننده همه پیام ها خارج میگردد و نیاز به غیرفعال سازی به طور دستی نیست!\n⚠️برای غیرفعال سازی پیش از موعد از دستور <b>Unmute all</b> استفاده کنید"
end
if matches[1] == "mute" and matches[2] == "all" and is_momod(msg) and matches[3] and matches[4] then
if  tonumber(matches[3]) < 5 or tonumber(matches[3]) > 420 then
		return "شما بین <b>5</b> دقیقه تا <b>420</b> دقیقه معادل <b>7</b> ساعت مجاز به انتخاب زمان برای پاک کننده همه پیام ها میباشید"
end
local value = matches[4]
local time = matches[3] * 60
redis:setex("muteall:"..chat_id, time, true)
return "پاک کننده همه پیام ها برای "..matches[3].." دقیقه فعال گردید\n〰〰〰〰〰〰〰〰〰〰〰〰\nپس از پایان مدت زمان تنظیم شده گروه به طور خودکار از حالت پاک کننده همه پیام ها خارج میگردد و نیاز به غیرفعال سازی به طور دستی نیست!\n⚠️برای غیرفعال سازی پیش از موعد از دستور <b>Unmute all</b> استفاده کنید\n\nتوضیحات اضافه : "..value
end
if matches[1] == "stats" and is_momod(msg) then
if matches[2] == "mute all" or matches[2] == "mute" then
local hash = "muteall:"..chat_id
muteall = redis:pttl(hash)
local enable = redis:get(hash)
base = math.floor(muteall / 1000)

if not enable then
   return "پاک کننده همه پیام ها غیر فعال است"
elseif enable then
   if math.floor(base / 60) == 0 then
      min = ""
   else 
      min = "یا <b>"..math.ceil(base / 60).." </b>دقیقه "
   end
   if math.floor(base / 3600) == 0 then
      hor = ""
   else
      hor = "یا <b>"..math.ceil(base / 3600).."</b> ساعت"
   end
   return "پاک کننده همه پیام ها برای <b>"..base.." </b>ثانیه "..min..hor.." فعال است\nپایان زمان میوت ال بشما اطلاع داده میشود"
end
end
end
if matches[1] == "mute" and matches[2] == "all" and is_momod(msg) then
            local hash = "muteall:"..chat_id
            local time = 3600 * 12
            redis:setex(hash, time, true)
            return "⚠پاک کننده همه پیام ها فعال گردید\n\n<code>این پاک کننده تا ̲1̲2 ساعت اینده فعال است </code>\n\n⚠️برای غیرفعال سازی پیش از موعد از دستور <b>Unmute all</b> استفاده کنید"
end
if matches[1] == "unmute" and matches[2] == "all" and is_momod(msg) then
    		local hash = "muteall:"..chat_id
			local enable = redis:get(hash)
			if not enable then
               return "پاک کننده همه پیام ها غیر فعال است"
			end
    		redis:del("muteall:"..chat_id)
            return "پاک کننده همه پیام ها غیر فعال گردید"
end
--------------------------------------------------#muteusers
if matches[1] == "mute" and is_momod(msg) then
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   end
   if msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "mute"})
   elseif matches[1] == "mute" and (matches[2]:match("(@[%a%d])")) then
       return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = "mute"})
	elseif matches[1] == "mute" and matches[2]:match("^%d+$") then
       user_id = matches[2] 
       return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "mute", msg_reply = msg.id_})
   elseif matches[1] == "mute" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	   user_id = msg.content_.entities_[0].user_id_
       return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "mute", msg_reply = msg.id_})
   end
end

if matches[1] == "unmute" and is_momod(msg) then
   if msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "unmute"})
   elseif matches[1] == "unmute" and (matches[2]:match("(@[%a%d])")) then
      return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = "unmute"})
   elseif matches[1] == "unmute" and matches[2]:match("^%d+$") then
          user_id = matches[2] 
          return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "unmute", msg_reply = msg.id_})
	elseif matches[1] == "unmute" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	       user_id = msg.content_.entities_[0].user_id_
          return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "unmute", msg_reply = msg.id_})
   end
end
-------------------------------------------
if matches[1] == "mutelist" and is_momod(msg) then
	     if next(data2[tostring(target)]["mutelist"]) == nil then
              return "لیستی تشکیل نشده است"
           end
           local i = 1
           local message = "افراد غیر مجاز در گروه :\n\n"
                 for k,v in pairs(data2[tostring(target)]["mutelist"]) do
                     message = message ..i.." - "..v.." [" ..k.. "] \n"
                 i = i + 1
                 end
   return sendmsg(chat_id, msg.id_, message, 1)
end

if matches[1] == "rmsg" and is_momod(msg) then
   function delmsgs(arg, data, arg)
           tt = data.messages_
		   --vardump(tt)
		   for i=1, #tt do
               delmsg(tt[i].chat_id_, {[0] = tt[i].id_})
            end
      end
    if chat_id:match("^-100") then
          if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then
             pm = '⚠️شما تعداد  1 عدد پیام تا 100 عدد پیام را در هر دفعه قادر هستید پاک کنید'
             return pm
             else
          tdcli_function ({
               ID = "GetChatHistory",
               chat_id_ = chat_id,
               from_message_id_ = 0,
               offset_ = 0,
               limit_ = tonumber(matches[2])
               }, delmsgs, {chat_id = chat_id})
			   pm ='<b>'..matches[2]..'</b> <i>پيام اخير پاک شد</i>'
			return pm
     end
 else pm ='اين امکان فقط در _سوپر گروه_ ممکن است.'
    return pm
end
end

if matches[1] == "del" and is_momod(msg) then
   function del_reply(arg, data, arg)
                delmsg(data.chat_id_, {[0] = data.id_})
      end
	  getmsg(chat_id, msg.reply_to_message_id_, del_reply, {msg = msg, chat_id = chat_id})
	return delmsg(chat_id, {[0] = msg.id_})
end

if matches[1] == "delall" and is_momod(msg) then
  local function deleteMessagesFromUser(chat_id, user_id)
  tdcli_function ({
    ID = "DeleteMessagesFromUser",
    chat_id_ = chat_id,
    user_id_ = user_id
  }, dl_cb, nil)
end
   function delall_reply(arg, data)
            local msg = arg.msg
            --[[if is_momod2(data.chat_id_, data.sender_user_id_) then
		       return sendmsg(data.chat_id_, msg.reply_to_message_id_, "ایشان <i>"..ranks2(data.chat_id_, data.sender_user_id_).."</i> است")
		    end]]
			deleteMessagesFromUser(data.chat_id_, data.sender_user_id_)
          return getuser(data.sender_user_id_, users_info, {msg = msg, chat_id = chat_id, cmd = "delall", msg_reply = msg.id_})
      end
   return getmsg(chat_id, msg.reply_to_message_id_, delall_reply, {msg = msg, chat_id = chat_id})
end

if matches[1] == "setname" and matches[2] and is_momod(msg) then
   return set_name(chat_id, msg.content_.text_:gsub("setname", ""))
end
   if receiver3(msg) == "to_sgp" then
      chat_id2 = tostring(target)
   end
-------------------------------------------------------
if matches[1] == "setexpire" and receiver2(msg) == "to_sgp" and matches[2] and not matches[3] and is_admin(msg) then
   local user_id = redis:get("setexpire"..bot_divest..chat_id)
   if user_id and tostring(msg.sender_user_id_) ~= tostring(user_id) and not is_sudo(msg) then
      --print(user_id, msg.sender_user_id_)
      return "شما مجاز به شارژ این گروه نیستید"
   end
   if tonumber(matches[2]) > 90 then
      return "به نظر شما 90 روز معادل 3 ماه بیشتر ، عجیب نیست ؟"
   end
   
   local time = os.time()
   local buytime = tonumber(os.time()) --86400
   local timeexpire = tonumber(buytime) + (tonumber(matches[2]) * 86400)
   redis:hset('expiretime'..bot_divest, chat_id2, timeexpire)
   redis:sadd("expiregroup"..bot_divest, chat_id2)
   return "تاریخ انقضای گروه به "..matches[2].. " روز دیگر تنظیم شد"
end

if matches[1] == "plan1" and receiver2(msg) == "to_sgp" and is_admin(msg) then
   local user_id = redis:get("setexpire"..bot_divest..chat_id)
   if user_id and tostring(msg.sender_user_id_) ~= tostring(user_id) and not is_sudo(msg) then
      --print(user_id, msg.sender_user_id_)
      return "شما مجاز به شارژ این گروه نیستید"
   end
   
   local time = os.time()
   local buytime = tonumber(os.time()) --86400
   local timeexpire = tonumber(buytime) + (tonumber(30) * 86400)
   redis:hset('expiretime'..bot_divest, chat_id2, timeexpire)
   redis:sadd("expiregroup"..bot_divest, chat_id2)
   return "پلن زمانی "..matches[1]:gsub("plan","").." معادل 1 ماه برای این گروه فعال شد\n⚠️میتوانید با دستور <b>Expire</b> تعداد روز باقی مانده به انقضای ربات در گروه را مشاهده کنید"
end

if matches[1] == "plan2" and receiver2(msg) == "to_sgp" and is_admin(msg) then
   local user_id = redis:get("setexpire"..bot_divest..chat_id)
   if user_id and tostring(msg.sender_user_id_) ~= tostring(user_id) and not is_sudo(msg) then
      --print(user_id, msg.sender_user_id_)
      return "شما مجاز به شارژ این گروه نیستید"
   end
   
   local time = os.time()
   local buytime = tonumber(os.time()) --86400
   local timeexpire = tonumber(buytime) + (tonumber(30*2) * 86400)
   redis:hset('expiretime'..bot_divest, chat_id2, timeexpire)
   redis:sadd("expiregroup"..bot_divest, chat_id2)
   return "پلن زمانی "..matches[1]:gsub("plan","").." معادل 2 ماه برای این گروه فعال شد\n⚠️میتوانید با دستور <b>Expire</b> تعداد روز باقی مانده به انقضای ربات در گروه را مشاهده کنید"
end

if matches[1] == "plan3" and receiver2(msg) == "to_sgp" and is_admin(msg) then
   local user_id = redis:get("setexpire"..bot_divest..chat_id)
   if user_id and tostring(msg.sender_user_id_) ~= tostring(user_id) and not is_sudo(msg) then
      --print(user_id, msg.sender_user_id_)
      return "شما مجاز به شارژ این گروه نیستید"
   end
   
   local time = os.time()
   local buytime = tonumber(os.time()) --86400
   local timeexpire = tonumber(buytime) + (tonumber(30*3) * 86400)
   redis:hset('expiretime'..bot_divest, chat_id2, timeexpire)
   redis:sadd("expiregroup"..bot_divest, chat_id2)
   return "پلن زمانی "..matches[1]:gsub("plan","").." معادل 3 ماه برای این گروه فعال شد\n⚠️میتوانید با دستور <b>Expire</b> تعداد روز باقی مانده به انقضای ربات در گروه را مشاهده کنید"
end

if matches[1] == "plan4" and receiver2(msg) == "to_sgp" and is_admin(msg) then
   local user_id = redis:get("setexpire"..bot_divest..chat_id)
   if user_id and tostring(msg.sender_user_id_) ~= tostring(user_id) and not is_sudo(msg) then
      --print(user_id, msg.sender_user_id_)
      return "شما مجاز به شارژ این گروه نیستید"
   end
   
   local time = os.time()
   local buytime = tonumber(os.time()) --86400
   local timeexpire = tonumber(buytime) + (tonumber(30*6) * 86400)
   redis:hset('expiretime'..bot_divest, chat_id2, timeexpire)
   redis:sadd("expiregroup"..bot_divest, chat_id2)
   return "پلن زمانی "..matches[1]:gsub("plan","").." معادل 6 ماه برای این گروه فعال شد\n⚠️میتوانید با دستور <b>Expire</b> تعداد روز باقی مانده به انقضای ربات در گروه را مشاهده کنید"
end


if matches[1] == "expire" and is_momod(msg) then
   local expiretime = redis:hget('expiretime'..bot_divest, chat_id2)
   if not expiretime then
      return "تاریخ انقضا تنظیم نشده است یا گروه شما نامحدود است"
   else
      local now = tonumber(os.time())
	  local time = (math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1).." روز دیگر تا پایان انقضای گروه"
	  --print(time)
      return time
   end
end

if matches[1] == "delexpire" and not matches[2] and is_admin(msg) then
   local user_id = redis:get("setexpire"..bot_divest..chat_id)
   if user_id and tostring(msg.sender_user_id_) ~= tostring(user_id) and not is_sudo(msg) then
      --print(user_id, msg.sender_user_id_)
      return "شما مجاز به شارژ این گروه نیستید"
   end
   local expiretime = redis:hget ('expiretime'..bot_divest, chat_id2)
   if not expiretime then
      return "تاریخ انقضا تنظیم نشده است"
   end
   redis:del("setexpire"..bot_divest..chat_id2)
   redis:hdel('expiretime'..bot_divest, chat_id2)
   redis:del('expires'..bot_divest..chat_id2, true)
   redis:del('expires'..bot_divest..chat_id2)
   redis:hdel('expiretime'..bot_divest, chat_id2)
   redis:del('expires'..bot_divest..chat_id2, true)
   redis:srem("expiregroup"..bot_divest, chat_id2)
   return "تاریخ انقضا برای این گروه پاک شد"
end

if matches[1] == "setexpire" and matches[2] and matches[3] and is_sudo(msg) then
   if not data2[tostring(matches[2]:gsub("-100",""))] then
	  return "همچین گروهی وجود ندارد"
   end
   expire = matches[3]
   chat_idw = matches[2]
   if redis:hget('expiretime'..bot_divest, chat_idw:gsub("-100", "")) then
      return "این گروه قبلا شارژ شده است"
   end
   local url , res = http.request("http://api.gpmod.ir/time/")
   local jdat = json:decode(url)
   redis:set("setexpire"..bot_divest..chat_idw:gsub("-100", ""), msg.sender_user_id_)
   local time = os.time()
   local buytime = tonumber(os.time())
   local timeexpire = tonumber(buytime) + (tonumber(expire) * 86400)
   redis:hset('expiretime'..bot_divest, chat_idw, timeexpire)
   redis:sadd("expiregroup"..bot_divest, chat_idw)
   return "تاریخ انقضای گروه به "..expire.. " روز دیگر تنظیم شد"
end

if matches[1] == "delexpire" and matches[2] and is_sudo(msg) then
   chat_idw = matches[2]
   redis:hdel("setexpire"..bot_divest..chat_idw, "expires")
   redis:hdel('expiretime'..bot_divest, chat_idw)
   redis:del('expires'..bot_divest..chat_idw, true)
   redis:hdel("setexpire"..bot_divest..chat_idw, "expires")
   redis:del('expires'..bot_divest..chat_idw)
   redis:hdel('expiretime'..bot_divest, chat_idw)
   redis:del('expires'..bot_divest..chat_idw, true)
   redis:srem("expiregroup"..bot_divest, chat_idw)
   return "تاریخ انقضا برای این گروه پاک شد"
end

if matches[1] == "expires" and is_sudo(msg) then
   if redis:scard("expiregroup"..bot_divest) == 0 then
	  return "هیچ تاریخ انقضایی در گروه ها ثبت نگردیده است"
   end
i = 1
text = ""
   for k,receiver in pairs(redis:smembers("expiregroup"..bot_divest)) do
       text = text..i.." -> <b>"..receiver.." </b>\n".."\n"
	   i = i + 1 
   end
   return text
end
--------------------------------------------------#muteusers
if matches[1] == "ban" and is_momod(msg) then
   if msg.can_be_deleted_ == false then
      return "ربات ادمین گروه نیست و نمیتواند چنین کاری انجام دهد"
   end
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, cmd = "ban"})
   elseif matches[1] == "ban" and (matches[2]:match("(@[%a%d])")) then
       return searchuser(matches[2], get_res, {msg = msg, cmd = "ban"})
	elseif matches[1] == "ban" and matches[2]:match("^%d+$") then
          user_id = matches[2] 
          return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "ban", msg_reply = msg.id_})
	elseif matches[1] == "ban" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	       user_id = msg.content_.entities_[0].user_id_
          return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "ban", msg_reply = msg.id_})
   end
end

if matches[1] == "unban" and is_momod(msg) then
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "unban"})
   elseif matches[1] == "unban" and (matches[2]:match("(@[%a%d])")) then
      return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = "unban"})
   elseif matches[1] == "unban" and matches[2]:match("^%d+$") then
      user_id = matches[2] 
      return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "unban", msg_reply = msg.id_})
   elseif matches[1] == "unban" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	  user_id = msg.content_.entities_[0].user_id_
      return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "unban", msg_reply = msg.id_})
   end
end
--------------------------------------------------#clean center
if matches[1] == "clean" and is_momod(msg) then
            if matches[2] == "owners" or matches[2] == "ownerlist" then
			    if not is_owner(msg) then
				       return "برای اجرای این دستور به مقام صاحب گروه(اونر) نیاز است"
			    end
				if next(data2[tostring(target)]["owners"]) == nil then
					return "لیستی تشکیل نشده است"
				end
				for k,v in pairs(data2[tostring(target)]["owners"]) do
					data2[tostring(target)]["owners"][tostring(k)] = nil
					save_data(data2)
				end
				return "لیست صاحبان گروه گروه خالی شد"
			end
			if matches[2] == "modlist" then
			    if not is_owner(msg) then
				   return "برای اجرای این دستور به مقام صاحب گروه(اونر) نیاز است"
			    end
				if next(data2[tostring(target)]["moderators"]) == nil then
					return "لیستی تشکیل نشده است"
				end
			    data2[tostring(target)]["moderators"] = {}
				save_data(data2)
				return "لیست مدیران گروه خالی شد"
			end
			if matches[2] == "rules" then
				local data_cat = "rules"
				if data2[tostring(target)][data_cat] == nil then
					return "ثوانینی تنظیم نگردیده است"
				end
				data2[tostring(target)][data_cat] = nil
				save_data(data2)
				return "قوانین گروه گروه پاک شد"
			end
			if matches[2] == "mutelist" then
			    if next(data2[tostring(target)]["mutelist"]) == nil then
					return "لیستی تشکیل نشده است"
				end
			    data2[tostring(target)]["mutelist"] = {}
				save_data(data2)
				return "لیست افراد غیر مجاز در چت خالی شد"
			end

			if matches[2] == "bots" then
               if is_super(msg) then
				  return getmembers(chat_id, 0, "Bots", 5000, get_bots, {msg = msg, chat_id = chat_id})
			   end
			end
			if matches[2] == "deleted" then
               return getmembers(chat_id, 0, "Recent", 5000, get_deleted, {msg = msg})
		    end
			if matches[2] == "filterlist" and is_momod(msg) then
               return clear_commandbad(msg, 1)
			end
		--------------------------------------------------#clean lists
            if matches[2] == "banlist" and is_owner(msg)  then
               local hash = 'ban_user:'..chat_id
			   if redis:scard(hash) == 0 then
			      return "لیست افراد بن شده خالی است"
			   end
               redis:del('ban_user:'..chat_id)
               return "لیست افراد بن شده خالی شد"
			end
            if matches[2] == "gbanlist" and is_sudo(msg) then
               local hash = "gbanned"
			   if redis:scard(hash) == 0 then
			      return "لیست افراد بن ال شده خالی است"
			   end
               redis:del(hash)
               return "لیست افراد بن ال شده در یوبی خالی شد"
			end
            if matches[2] == "gmutelist" and is_sudo(msg) then
               local hash = "muteall_user"
			   if redis:scard(hash) == 0 then
			      return "لیست افراد محروم از چت در گروه های یوبی خالی است"
			   end
               redis:del(hash)
               return "لیست افراد محروم از چت در گروه های یوبی خالی شد"
            end
	end
--------------------------------------------------#
if matches[1] == "help" and not matches[2] and is_momod(msg) then
   return config.help
   --senddoc(chat_id, msg.id_, nil, "BQADBQADBwADmXHxV5JOAAFSZ5gebAI", "test")
elseif matches[1] == "help" and matches[2] == "lock" and is_momod(msg) then
   return config.helpset
end
--------------------------------------------------#flood set settings
if matches[1] == "setflood" and is_momod(msg) then
   if tonumber(matches[2]) < 2 or tonumber(matches[2]) > 10 then
      return "عدد انتخابی باید بین 2 تا 10 باشد\nبرای باز کردن کلی ان از دستور <b>UNLOCK FLOOD </b>بهره ببرید"
   end
   data2[tostring(target)]["settings"]["flood_msg_max"] = matches[2]
   save_data(data2)
   return "تعداد پیام های مکرر به "..matches[2].." محدود شد"
   end
   if matches[1] == "settimeflood" and is_momod(msg) then
	  if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 5 then
		 return "عدد انتخابی باید بین 1 تا 5 باشد"
	  end
	  data2[tostring(target)]["settings"]["flood_time_max"] = matches[2]
	  save_data(data2)
	   return "زمان تعداد پیام های مکرر "..matches[2].." محدود شد"
end
if matches[1] == "ub" then
local about = [[تله یوبی (اولترا بوت)

گروه منیجر و انتی اسپم نوشته شده به زبان لوا <b>Lua</b>
بدون پلاگین با اپدیت های فراوان امنیت را برای شما به ارمغان می آورد

گرداورنده : @ValtMan

کانال اختصاصی : @UB_CH

کانال پشتیبانی : @TELUB

نسخه : ]]..VER..[[


<code>شما مشتری گرامی ملزم به این هستید که قوانین ربات را مطالعه بفرمایید
عدم مطالعه آن به ضرر شما خواهد بود
تیم ربات فروشی یوبی هیچگونه مسولیتی در قبال پاک شدن یا فیلتر شدن گروه یا کاهش اعضای گروه ندارد.</code>
]]
    return about
  end

------------------------------------------------------
if matches[1] == "wlc" and matches[2] == "on" and is_momod(msg) then
   if data2[tostring(chat_id:gsub("-100",""))]["settings"]["wlc"] == "on" then
      return "پیام خوش آمدگویی فعال است"
   else
      data2[tostring(chat_id:gsub("-100",""))]["settings"]["wlc"] = "on"
      save_data(data2)
      return "پیام خوش آمدگویی فعال گردید\nمتن خوش آمد گویی را هم با <b>SETWLC</b> شخصی سازی کنید"
   end
end
if matches[1] == "wlc" and matches[2] == "off" and is_momod(msg) then
   if data2[tostring(chat_id:gsub("-100",""))]["settings"]["wlc"] == "off" then
      return "پیام خوش آمدگویی غیرفعال است"
   else
      data2[tostring(chat_id:gsub("-100",""))]["settings"]["wlc"] = "off"
      save_data(data2)
      return "پیام خوش آمدگویی غیرفعال گردید"
   end
end
if matches[1] == "setwlc" and matches[2] and is_momod(msg) then
        if data2[tostring(chat_id:gsub("-100",""))]["settings"]["wlc"] == "off" then
		   return "⚠️پیام خوش آمدگویی غیرفعال است\nبا <b>WLC ON </b> فعال کنید"
		end
		local text = msg.content_.text_:gsub("[!/#]", "")
        data2[tostring(chat_id:gsub("-100",""))]["group_wlc"] = text:gsub("[Ss][Ee][Tt][Ww][Ll][Cc]", " ")
        save_data(data2)
        return "متن پیام خوش آمدگویی تغییر کرد\n⚠️میتوانید با <b>WLC</b> متن خوش امدگویی را مشاهده کنید"
end

 if matches[1] == "delwlc" and is_momod(msg) then
        if data2[tostring(chat_id:gsub("-100",""))]["settings"]["wlc"] == "off" then
		   return "⚠️پیام خوش امدگویی غیرفعال است\nبا <b>WLC ON </b> فعال کنید"
		end
        data2[tostring(chat_id:gsub("-100",""))]["group_wlc"] = nil
        save_data(data2)
        return "متن پیام خوش امدگویی حذف شد"
end
--------------------------------------------------#command from normal users settings
   if matches[1] == "cmuser" and is_momod(msg) then
      if matches[2] == "lock" then
	     if not data2[tostring(target)]["settings"]["cmuser"] then
		    data2[tostring(target)]["settings"]["cmuser"] = {}
		 end
		 if not data2[tostring(target)]["settings"]["cmusers"] then
		    data2[tostring(target)]["settings"]["cmusers"] = "momod"
		 end
	     if data2[tostring(target)]["settings"]["cmuser"] == "yes" then
	        return "محدودیت پاسخ ربات برای افراد عادی فعال است"
         else
	        data2[tostring(target)]["settings"]["cmuser"] = "yes"
            save_data(data2)
            return "محدودیت پاسخ ربات برای افراد عادی فعال گردید"
	     end
   
    elseif matches[2] == "unlock" then
	       if data2[tostring(target)]["settings"]["cmuser"] == "no" then
	          return "محدودیت پاسخ ربات برای افراد عادی غیرفعال است"
           else
		      data2[tostring(target)]["settings"]["cmuser"] = "no"
			  data2[tostring(target)]["settings"]["cmusers"] = "momod"
			  save_data(data2)
              return "محدودیت پاسخ ربات برای افراد عادی غیرفعال گردید"
           end
	elseif matches[2] == "owner" and is_owner(msg) then
	       if data2[tostring(target)]["settings"]["cmuser"] == "no" then
	          return "محدودیت پاسخ ربات برای افراد عادی غیرفعال است"
		   end
	       data2[tostring(target)]["settings"]["cmusers"] = "owner"
		   save_data(data2)
		   return "محدودیت پاسخ ربات به صاحب گروه تغییر یافت"
    elseif matches[2] == "owner1" and is_owner1(msg) then
           if data2[tostring(target)]["settings"]["cmuser"] == "no" then
	          return "محدودیت پاسخ ربات برای افراد عادی غیرفعال است"
		   end
	       data2[tostring(target)]["settings"]["cmusers"] = "owner1"
		   save_data(data2)
		   return "محدودیت پاسخ ربات به صاحب اصلی گروه تغییر یافت"
    elseif matches[2] == "admin" and is_admin1(msg) then
           if data2[tostring(target)]["settings"]["cmuser"] == "no" then
	          return"محدودیت پاسخ ربات برای افراد عادی غیرفعال است"
		   end
	       data2[tostring(target)]["settings"]["cmusers"] = "admin"
		   save_data(data2)
		   return "محدودیت پاسخ ربات به ادمین ربات تغییر یافت"
    elseif matches[2] == "sudo" and is_sudo(msg) then
           if data2[tostring(target)]["settings"]["cmuser"] == "no" then
	          return "محدودیت پاسخ ربات برای افراد عادی غیرفعال است"
		   end
	       data2[tostring(target)]["settings"]["cmusers"] = "sudo"
		   save_data(data2)
		   return "محدودیت پاسخ ربات به سازنده ربات تغییر یافت"
     end
  end

--------------------------------------------------#addadmin by sudo
if matches[1] == "addadmin" and is_sudo(msg) then
   if not data2["admins"] then
      data2["admins"] = {}
      save_data(data2)
   end
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = matches[1]})
   elseif matches[1] == "addadmin" and (matches[2]:match("(@[%a%d])")) then
      return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = matches[1]})
	elseif matches[1] == "addadmin" and matches[2]:match("^%d+$") then
      user_id = matches[2] 
      return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = matches[1], msg_reply = msg.reply_to_message_id_})
    elseif matches[1] == "addadmin" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	  user_id = msg.content_.entities_[0].user_id_
      return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = matches[1], msg_reply = msg.id_})
   end
end

if matches[1] == "killadmins" and is_sudo(msg) then
   if not data2["admins"] then
      data2["admins"] = {}
      save_data(data2)
   end
      data2["admins"] = {}
      save_data(data2)
      return "<b>The administrators were dismissed </b>!"
end
--------------------------------------------------#removeadmin by sudo
if matches[1] == "remadmin" and is_sudo(msg) then
   if not data2["admins"] then
      data2["admins"] = {}
      save_data(data2)
   end
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = matches[1]})
   elseif matches[1] == "remadmin" and (matches[2]:match("(@[%a%d])")) then
      return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = matches[1]})
	elseif matches[1] == "remadmin" and matches[2]:match("^%d+$") then
      user_id = matches[2] 
      return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = matches[1], msg_reply = msg.reply_to_message_id_})
    elseif matches[1] == "remadmin" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	  user_id = msg.content_.entities_[0].user_id_
      return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = matches[1], msg_reply = msg.id_})
   end
end

----------------------------------------------
if matches[1] == "listadmins" then
	if not data2[tostring("admins")] then
		data2[tostring("admins")] = {}
		save_data(data2)
	end
	if next(data2[tostring("admins")]) == nil then
       return "لیستی تشکیل نشده است"
    end
	local message = "List of global admins:\n"
	for k,v in pairs(data2[tostring("admins")]) do
		message = message .. "- " .. v .. " [" .. k .. "] " .."\n"
	end
	return message
end
----------------------------------------------
if matches[1] == "clear" and is_owner(msg) then
   if redis:get("command:clear"..our_id..chat_id) then 
      return 'در هر نیم ساعت مجاز به پاک کردن تمامی پیام ها هستید'
   end
   redis:setex("command:clear"..our_id..chat_id, 1800, true)
   return getmembers(chat_id, 0, "Recent", 8000, clean_msg, {msg = msg, chat_id = chat_id})
end

if matches[1] == "whois" and is_momod(msg) then
   sendmen(chat_id, msg.id_, '⚠️برای دیدن اطلاعات بر روی متن کلیک کنید', tostring(matches[2]))
end
------------------------------------------------
  if matches[1] == "p" and not matches[2] and is_sudo(msg) then
     return list_all_plugins()
  end
  if matches[1] == "p" and  matches[2] == "+" and is_sudo(msg) then
     local plugin_name = matches[3]
     return enable_plugin(plugin_name)
  end
   if matches[1] == "p" and  matches[2] == "-" and is_sudo(msg) then
      if matches[3] == "core" then
         return "⚠️پلاگین مادر را نمیتوانید غیرفعال کنید."
      end
      local plugin_name = matches[3]
      return disable_plugin(plugin_name)
   end
  if matches[1] == "p" and  matches[2] == "r" and is_admin(msg) then
     return reload_plugins(true)
  end
------------------------------------------
if matches[1] == "invite" and is_sudo(msg) then
   if msg.reply_to_message_id_ ~= 0 then
      function invite_reply(arg, data, success)
		  local msg = arg.msg
          local user = data.sender_user_id_
		  return tdcli_function({ID = "AddChatMember", chat_id_ = arg.chat_id, user_id_ = user, forward_limit_ = 0}, dl_cb, nil)
      end
      return getmsg(chat_id, msg.reply_to_message_id_, invite_reply, {msg = msg, chat_id = chat_id})
   elseif matches[1] == "invite" and (matches[2]:match("(@[%a%d])")) then
       function invite_by_username(arg, data)
		  msg = arg.msg 
          user = data.id_
		  return tdcli_function({ID = "AddChatMember", chat_id_ = arg.chat_id, user_id_ = user, forward_limit_ = 0}, dl_cb, nil)
      end
       return searchuser(matches[2], invite_by_username, {msg = msg, chat_id = chat_id})
	elseif matches[1] == "invite" and matches[2]:match("^%d+$") then
          user = matches[2] 
		  tdcli_function({ID = "AddChatMember", chat_id_ = chat_id, user_id_ = user, forward_limit_ = 0}, dl_cb, nil)
	elseif matches[1] == "invite" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	       user_id = msg.content_.entities_[0].user_id_
		   tdcli_function({ID = "AddChatMember", chat_id_ = chat_id, user_id_ = user, forward_limit_ = 0}, dl_cb, nil)
   end
end
-----------------------------------------------warn
if matches[1] == "warn" and is_momod(msg) then
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "warn"})
   elseif matches[1] == "warn" and matches[2] and (matches[2]:match("(@[%a%d])")) then
      return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = "warn"})
   elseif matches[1] == "warn" and matches[2] and matches[2]:match("^%d+$") then
      user = matches[2] 
	  return getuser(user, users_info, {chat_id = chat_id, cmd = "warn", msg_reply = msg.id_})
   elseif matches[1] == "warn" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	  user_id = msg.content_.entities_[0].user_id_
      return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "warn", msg_reply = msg.id_})
   end
end
if matches[1] == "unwarn" and is_momod(msg) then
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "unwarn"})
   elseif matches[1] == "unwarn" and matches[2] and (matches[2]:match("(@[%a%d])")) then
      return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = "unwarn"})
   elseif matches[1] == "unwarn" and matches[2] and matches[2]:match("^%d+$") then
      user_id = matches[2] 
      return getuser(user_id, users_info, {chat_id = chat_id, cmd = "unwarn", msg_reply = msg.id_})
   elseif matches[1] == "unwarn" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	  user_id = msg.content_.entities_[0].user_id_
      return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "unwarn", msg_reply = msg.id_})
   end
end
if matches[1] == "unwarnall" and is_momod(msg) then
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "unwarn"})
   elseif matches[1] == "unwarnall" and (matches[2]:match("(@[%a%d])")) then
       return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = "unwarn"})
	elseif matches[1] == "unwarnall" and matches[2]:match("^%d+$") then
          user_id = matches[2] 
		  return getuser(user_id, users_info, {chat_id = chat_id, cmd = "unwarnall", msg_reply = msg.id_})
	 elseif matches[1] == "unwarnall" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	      user_id = msg.content_.entities_[0].user_id_
          return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "unwarnall", msg_reply = msg.id_})
   end
end
--------------------------------------------------#center warn control
if matches[1] == "setwarn" and is_momod(msg) then
if not is_owner(msg) then
   return "برای تنظیم این قفل به مقام صاحب گروه(owner) نیاز است"
end
local mwarn = tonumber(matches[2])
if mwarn < 2 or mwarn > 10 then
   return "خطا!!\nعدد ورودی باید بین 3 تا 10 باشد"
end
redis:set("mwarn"..bot_divest..":"..chat_id, mwarn)
return "محدودیت اخطار ها به کاربر تغییر کرد به <b>"..mwarn.."</b>\n<code>این مقدار محدودیت هم برای اخطار کاربر و اخطار هر قفل استفاده میشود</code>"
end

if matches[1] == "warn" and is_momod(msg) and not matches[2] then
if type(msg.reply_id) ~= "nil" then
   return false
end
local mwarn = redis:get("mwarn"..bot_divest..":"..chat_id)
if not mwarn then
   mwarn = 4
end
return "محدودیت اخطار ها به کاربر<b> "..mwarn.." </b>میباشد"
end
---------------------------------------------
if matches[1] == "block" and is_sudo(msg) then
   if msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "block"})
   elseif matches[1] == "block" and matches[2] and (matches[2]:match("(@[%a%d])")) then
       return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = "block"})
	elseif matches[1] == "block" and matches[2] and matches[2]:match("^%d+$") then
          user = matches[2] 
		  return getuser(user, users_info, {chat_id = chat_id, cmd = "block", msg_reply = msg.id_})
	 elseif matches[1] == "block" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	       user_id = msg.content_.entities_[0].user_id_
           return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "block", msg_reply = msg.id_})
   end
end
if matches[1] == "unblock" and is_sudo(msg) then
   if msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "unblock"})
   elseif matches[1] == "unblock" and matches[2] and (matches[2]:match("(@[%a%d])")) then
       return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = "unblock"})
   elseif matches[1] == "unblock" and matches[2] and matches[2]:match("^%d+$") then
       user = matches[2] 
	   return getuser(user, users_info, {chat_id = chat_id, cmd = "unblock", msg_reply = msg.id_})
   elseif matches[1] == "unblock" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	   user_id = msg.content_.entities_[0].user_id_
       return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "unblock", msg_reply = msg.id_})
   end
end
-----------------------------------------
if matches[1] == "me" and not matches[2] then
   return getuser(msg.sender_user_id_, users_info, {msg = msg, chat_id = chat_id, cmd = "me", msg_reply = msg.id_})
end
if matches[1] == "info" and is_momod(msg) then
   if msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = "info", msg_reply = msg.id_})
   elseif matches[1] == "info" and matches[2] and (matches[2]:match("(@[%a%d])")) then
       return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = "info", msg_reply = msg.id_})
   elseif matches[1] == "info" and matches[2] and matches[2]:match("^%d+$") then
       user_id = matches[2] 
	   return getuser(user_id, users_info, {chat_id = chat_id, cmd = "info", msg_reply = msg.id_})
   elseif matches[1] == "info" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	   user_id = msg.content_.entities_[0].user_id_
       return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = "info", msg_reply = msg.id_})
   end
end
----------------------------------------
if matches[1] == 'setprice' and matches[2] and is_sudo(msg) then
   text = msg.content_.text_:gsub("setprice","")
   redis:set("price", text)
   return "Done!"
end
if matches[1] == 'price' and is_sudo(msg) then
   return redis:get("price")
end
-----------------------------------------
if matches[1] == "ping" then
   local text = 'Pong'
   return sendmen(chat_id, msg.id_, text, msg.sender_user_id_)
end
---------------------------------------------------
if matches[1] == "no ads" and is_sudo(msg) then
   redis:set("bot:endmsg:chat"..bot_divest..chat_id, true)
   return "تبلیغات در این گروه پایان یافت"
end
if matches[1] == "yes ads" and is_sudo(msg) then
   redis:del("bot:endmsg:chat"..bot_divest..chat_id, true)
   return "تبلیغات در این گروه شروع شد"
end
if matches[1] == "add vip" and is_sudo(msg) then
   redis:set("bot:endmsg:chat"..bot_divest..chat_id, true)
   redis:sadd("vip_group"..bot_divest, chat_id)
   return "این گروه به گروه های ویژه افزوده شد\n⚠️<code>قابلیت های جدید را با vhelp دریافت کنید</code>"
end
if matches[1] == "rem vip" and is_sudo(msg) then
   redis:del("bot:endmsg:chat"..bot_divest..chat_id, true)
   redis:sadd("vip_group"..bot_divest, chat_id)
   return "این گروه از گروه های ویژه حذف شد"
end

if matches[1] == "addcontact" and is_sudo(msg) then
   if msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = matches[1]})
   end
end

if matches[1] == "remcontact" and is_sudo(msg) then
   if msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = matches[1]})
   end
end

if matches[1] == "share" and is_sudo(msg) then
   return getuser(our_id, users_info, {msg = msg, chat_id = chat_id, cmd = "share", msg_reply = msg.id_})
end

if matches[1] == "protect" and is_momod(msg) then
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = matches[1]})
   elseif matches[1] == "protect" and (matches[2]:match("(@[%a%d])")) then
       return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = matches[1]})
   elseif matches[1] == "protect" and matches[2]:match("^%d+$") then
       return getuser(matches[2], users_info, {msg = msg, chat_id = chat_id, cmd = matches[1], msg_reply = msg.id_})
   elseif matches[1] == "protect" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	   user_id = msg.content_.entities_[0].user_id_
       return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = matches[1], msg_reply = msg.id_})
    end
end
if matches[1] == "unprotect" and is_momod(msg) then
   if msg.reply_to_message_id_ == 0 and not matches[2] then
      return "⚠️شما باید این عبارت را روی کاربر مورد نظر خود ریپلی کنید\n<code>یا بصورت فرمول زیر وارد کنید</code>\n<b>"..matches[1].."</b> [يوزرنيم | ايدي ]"
   elseif msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = matches[1]})
   elseif matches[1] == "unprotect" and (matches[2]:match("(@[%a%d])")) then
       return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = matches[1]})
   elseif matches[1] == "unprotect" and matches[2]:match("^%d+$") then
       return getuser(matches[2], users_info, {msg = msg, chat_id = chat_id, cmd = matches[1], msg_reply = msg.id_})
   elseif matches[1] == "unprotect" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	   user_id = msg.content_.entities_[0].user_id_
       return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = matches[1], msg_reply = msg.id_})
    end
end

function get_groups(arg, data)
		local title = data.title_
		local chat_id = data.id_
		--print(title)
		if not title then
		   title = "no name"
	    end
		redis:sadd("get_group", arg.chat_id.." "..title)
end

if matches[1] == "grouplist" and is_sudo(msg) then
   local i = 1
   local text = "List groups in "..our_id2[3].." :\n\n"
   for k,chats_id in pairs(data2[tostring("groups")]) do
	    text = text..i.." "..chats_id.."\n"
		i = i + 1
	end
	return text
end

function whereis(arg, data)
		local chat_id = arg.chat_id
		return sendmsg(chat_id, arg.reply, vardump2(data))
end

if matches[1] == "whereis" and is_sudo(msg) then
   text = matches[2]:gsub("-100", "")
   tdcli_function({ ID = "GetChat", chat_id_ = "-100"..text }, whereis, {reply = msg.id_ , chat_id = chat_id})
end


if matches[1] == "setrank" and is_sudo(msg) then
   if msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = matches[1], rank = matches[2]})
   elseif matches[1] == "setrank" and matches[2] and (matches[2]:match("(@[%a%d])")) then
       return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = matches[1], rank = matches[3]})
	elseif matches[1] == "setrank" and matches[2] and matches[2]:match("^%d+$") then
          user = matches[2] 
		  return getuser(user, users_info, {chat_id = chat_id, cmd = matches[1], msg_reply = msg.id_, rank = matches[3]})
	 elseif matches[1] == "setrank" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	       user_id = msg.content_.entities_[0].user_id_
           return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = matches[1], msg_reply = msg.id_, rank = matches[3]})
   end
end

if matches[1] == "delrank" and is_sudo(msg) then
   if msg.reply_to_message_id_ ~= 0 then
      return getmsg(chat_id, msg.reply_to_message_id_, get_res, {msg = msg, chat_id = chat_id, cmd = matches[1]})
   elseif matches[1] == "delrank" and matches[2] and (matches[2]:match("(@[%a%d])")) then
       return searchuser(matches[2], get_res, {msg = msg, chat_id = chat_id, cmd = matches[1]})
   elseif matches[1] == "delrank" and matches[2] and matches[2]:match("^%d+$") then
       user = matches[2] 
	   return getuser(user, users_info, {chat_id = chat_id, cmd = matches[1], msg_reply = msg.id_})
   elseif matches[1] == "delrank" and matches[2] and msg.content_.entities_[0].ID == "MessageEntityMentionName" then
	   user_id = msg.content_.entities_[0].user_id_
       return getuser(user_id, users_info, {msg = msg, chat_id = chat_id, cmd = matches[1], msg_reply = msg.id_})
   end
end

if matches[1] == "wit" and (msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://telegram.me/joinchat/%S+)")) and is_admin(msg) then
function check_link2(arg, data, success)
  --vardump(data)
  if not is_groups(data.chat_id_) then
     return sendmsg(arg.chat_id, 0, "این گروه در هیچ رباتی ذخیره نشده است")
  else
     return sendmsg(arg.chat_id, 0, "مشکلی نیست")
  end
end
   link = string.match(msg.content_.text_:gsub("https://t.me/joinchat/", "https://telegram.me/joinchat/"), "https://telegram.me/joinchat/%S+")
  tdcli_function({ID = "CheckChatInviteLink", invite_link_ = link}, check_link2, {link = link, chat_id = chat_id})
end

if matches[1] == "type" then
   local text = "نوع گروه : "..data2[tostring(target)]["group_type"]
   return text
end

if matches[1] == "settype" and matches[2] and is_owner(msg) then
   data2[tostring(target)]["group_type"] = matches[2]
   save_data(data2)
   return "نوع سوپر گروه به "..matches[2].." تغییر کرد"
end

if matches[1] == "adder" and matches[2] == "on" and is_momod(msg) then
   if not data2[tostring(target)]["adder"] then
      data2[tostring(target)]["adder"] = {}
   end
   data2[tostring(target)]["adder"]["active"] = "yes"
   data2[tostring(target)]["adder"]["user"] = {}
   save_data(data2)
   return "تعداد افراد اضافه کننده ممبر به گروه فعال شد"
elseif matches[1] == "adder" and matches[2] == "off" and is_momod(msg) then
   data2[tostring(target)]["adder"]["active"] = "no"
   return "تعداد افراد اضافه کننده ممبر به گروه غیر فعال شد"
end

if matches[1] == "adders" and is_momod(msg) then
   local i = 1
           local message = "\nلیست اضافه کنندگان :\n\n"
                 for k,v in pairs(data2[tostring(target)]["adder"]["user"]) do
					 if v == false then
					    v = "Deleted Account"
					 end
                     message = message ..i.." - "..v.." [<b>"..k.."</b>] -> " ..data2[tostring(target)]["adder"]["number"][tostring(k)].. " نفر\n" 
                     i = i + 1
                 end
       return sendmsg(chat_id, msg.id_, message.."\n\nبرای خالی کردن این لیست میتوانید دستور <b>Clean adders</b> را بزنید")
end

if matches[1] == "clean" and matches[2] == "adders" then
   data2[tostring(target)]["adder"]["user"] = {}
   data2[tostring(target)]["adder"]["number"] = {}
   save_data(data2)
   return "پاک شد"
end



end

return {
  patterns = {
  "^(id)$",
  "^(id) (.*)$",
  "^(vardump)$",
  "^(add)$",
  "^(rem)$",
  "^(leave) (.*)$",
  "^(add vip)$",
  "^(rem vip)$",
  "^(rem) (.*)$",
  "^(pin)$",
  "^(delwlc)$",
  "^(unpin)$",
  "^(pinall)$",
  "^(owner)$",
  "^(addadmin) (.*)$",
  "^(remadmin) (.*)$",
  "^(addadmin)$",
  "^(remadmin)$",
  "^(listadmins)$",
  "^(setowner)$",
  "^(setowner) (.*)$",
  "^(setowners)$",
  "^(setowners) (.*)$",
  "^(remowners)$",
  "^(remowners) (.*)$",
  "^(promote)$",
  "^(promote) (.*)$",
  "^(demote)$",
  "^(demote) (.*)$",
  "^(setrules)$",
  "^(setlink) (.*)$",
  "^(setrules) (.*)$",
  "^(rules)$",
  "^(setabout)$",
  "^(setabout) (.*)$",
  "^(about)$",
  "^(owners)$",
  "^(ownerlist)$",
  "^(modlist)$",
  "^(gpinfo)$",
  "^(mutelist)$",
  "^(setlink)$",
  "^(link)$",
  "^(join) (.*)$",
  "^(settings)$",
  "^(leave)$",
  "^(kick)$",
  "^(kick) (.*)$",
  "^(whois) (%d+)$",
  "^(unlock) (.*)$",
  "^(lock) (%a+) (%a+)$",
  "^(lock) (.*)$",
  "^(unfilter) (.*)$",
  "^(filter) (.*)$",
  "^(filterlist)$",
  "^(config)$",
  "^(config admins)$",
  "^(getpro) (.*)$",
  "^(mute)$",
  "^(unmute)$",
  "^(mute) (all) (%d+)$",
  "^(mute) (all) (%d+)h$",
  "^(mute) (all) (%d+) (.*)",
  "^(stats) (mute)",
  "^(stats) (mute all)",
  "^(mute) (.*)$",
  "^(unmute) (.*)$",
  "^(endmsg) (.*)$",
  "^(setend) (.*)$",
  "^(rmsg) (.*)$",
  "^(del)$",
  "^(delall)$",
  "^(setname) (.*)$",
  "^(expire)$",
  "^(expires)$",
  "^(delexpire)$",
  "^(setexpire) (%d+)$",
  "^(delexpire) (%d+)$",
  "^(setexpire) (%d+) (%d+)$",
  "^(delexpires)$",
  "^(endexpires)$",
  "^(delendexpires)$",
  "^(serverinfo)$",
  "^(unban)$",
  "^(unban) (.*)$",
  "^(wlc) (.*)$",
  "^(setwlc) (.*)$",
  "^(ban)$",
  "^(help)$",
  "^(help) (.*)$",
  "^(ban) (.*)$",
  "^(cmuser) (.*)$",
  "^(setflood) (%d+)$",
  "^(settimeflood) (%d+)$",
  "^(clean) (.*)$",
  "^(ub)$",
  "^(clear)$",
  "^(p)$",
  "^(p) (r)$",
  "^(broadcast) +(.+)$",
  "^(bc) (%d+) (.*)$",
  "^(p) (+) ([%w_%.%-]+)$",
  "^(p) (-) ([%w_%.%-]+)$",
  "^(invite)$",
  "^(invite) (.*)$",
  "^(setwarn) (%d+)$",
  "^(getwarn) (.*)$",
  "^(getwarn)$",
  "^(warn) (.*)$",
  "^(warn)$",
  "^(unwarn) (.*)$",
  "^(unwarn)$",
  "^(unwarnall) (.*)$",
  "^(unwarnall)$",
  "^(block)$",
  "^(me)$",
  "^(banlist)$",
  "^(block) (.*)$",
  "^(unblock)$",
  "^(unblock) (.*)$",
  "^(setprice) (.*)$",
  "^(price)$",
  "^(ping)$",
  "^(no ads)$",
  "^(yes ads)$",
  "^(addcontact)$",
  "^(remcontact)$",
  "^(protect)$",
  "^(protect) (.*)$",
  "^(whitelist)$",
  "^(grouplist)$",
  "^(unprotect)$",
  "^(unprotect) (.*)$",
  "^(share)$",
  "^(plan%d+)$",
  "^(whereis) (.*)$",
  "^(setrank) (.*)",
  "^(setrank) (@%S+) (.*)",
  "^(rank)$",
  "^(info)$",
  "^(info) (.*)",
  "^(wit) (.*)$",
  "^(delrank)$",
  "^(delrank) ([^%x]+)$",
  "^(type)$",
  "^(adder) (on)$",
  "^(adder) (off)$",
  "^(adders)$",
  "^(settype) (.*)$"
  },
  run = run,
}
