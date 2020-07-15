serpent = dofile("./File_Libs/serpent.lua")
https = require("ssl.https")
http = require("socket.http")
JSON = dofile("./File_Libs/JSON.lua")
local database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
ServerLucifer = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local AutoFilesLucifer = function() 
local Create_Info = function(Token,Sudo,UserName)  
local Tshake_Info_Sudo = io.open("sudo.lua", 'w')
Tshake_Info_Sudo:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  

UserName = "]]..UserName..[["
]])
Tshake_Info_Sudo:close()
end  
if not database:get(ServerLucifer.."TokenLucifer") then
print("\27[1;34m»» Send Your Token Bot :\27[m")
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31m»» Sorry The Token is not Correct \n\27[0;39;49m')
else
io.write('\n\27[1;31m»» The Token Is Saved\n\27[0;39;49m')
database:set(ServerLucifer.."TokenLucifer",token)
end 
else
io.write('\n\27[1;31mThe Tokem was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
if not database:get(ServerLucifer.."UserNameLucifer") then
print("\27[1;34m\n»» Send Your UserName Sudo : \27[m")
local UserName = io.read():gsub('@','')
if UserName ~= '' then
local Get_Info = http.request("http://tshake.ml/info/?user="..UserName)
if Get_Info:match('Is_Spam') then
io.write('\n\27[1;31m»» Sorry The server is Spsm \nتم حظر السيرفر لمدة 5 دقايق بسبب التكرار\n\27[0;39;49m')
return false
end
local Json = JSON:decode(Get_Info)
if Json.Info == false then
io.write('\n\27[1;31m»» Sorry The UserName is not Correct \n\27[0;39;49m')
os.execute('lua start.lua')
else
if Json.Info == 'Channel' then
io.write('\n\27[1;31m»» Sorry The UserName Is Channel \n\27[0;39;49m')
os.execute('lua start.lua')
else
io.write('\n\27[1;31m»» The UserNamr Is Saved\n\27[0;39;49m')
database:set(ServerLucifer.."UserNameLucifer",Json.Info.Username)
database:set(ServerLucifer.."IdLucifer",Json.Info.Id)
end
end
else
io.write('\n\27[1;31mThe UserName was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
local function FilesLucifer_Info()
Create_Info(database:get(ServerLucifer.."TokenLucifer"),database:get(ServerLucifer.."IdLucifer"),database:get(ServerLucifer.."UserNameLucifer"))   
local RunTshake = io.open("Lucifer", 'w')
RunTshake:write([[
#!/usr/bin/env bash
cd $HOME/TshAkE
token="]]..database:get(ServerLucifer.."TokenLucifer")..[["
while(true) do
rm -fr ../.telegram-cli
./tg -s ./Lucifer.lua -p PROFILE --bot=$token
done
]])
RunTshake:close()
local RunTs = io.open("lr", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/Lucifer
while(true) do
rm -fr ../.telegram-cli
screen -S Lucifer -X kill
screen -S Lucifer ./Lucifer
done
]])
RunTs:close()
end
FilesLucifer_Info()
database:del(ServerLucifer.."TokenLucifer");database:del(ServerLucifer.."IdLucifer");database:del(ServerLucifer.."UserNameLucifer")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
AutoFilesLucifer()  
var = true
else   
f:close()  
database:del(ServerLucifer.."TokenLucifer");database:del(ServerLucifer.."IdLucifer");database:del(ServerLucifer.."UserNameLucifer")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
var = false
end  
return var
end
Load_File()
