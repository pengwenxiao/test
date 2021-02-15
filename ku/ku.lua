
import"java.io.*"--文件,zip
import "android.content.*"




--文件操作,自动创建文件夹
function fw(logfile,linshi)
  a=string.gmatch(logfile,".-%/")
  local file=""
  for i in a do
    file=file..i
    os.execute('mkdir '..file)
  end
  local c=io.open(""..logfile,"w")
  c:write(linshi)
  c:close()
  return true
end

function fr(file)--sd卡开始
  local c=io.open(""..file,"r")--打开文件
  if not c then
    return(nil)
  else
    local r=c:read("*a")
    c:close()
    return(r)
  end
end


function fe(file)--sd卡开始
  local c=io.open(""..file,"r")
  if not c then
    return false
  else
    c:close()
    return true
  end
end

--sd开始,返回排序后的表 目录+文件,目录,文件
function fl(file)
  local tt={}
  local t1={}
  local t2={}
  local f=File(""..file)
  local fs=f.listFiles()
  fs=fs or String[0]
  Arrays.sort(fs) 
  for n=0,#fs-1 do
    if fs[n].isDirectory() then
      table.insert(t1,tostring(fs[n]))
    else
      table.insert(t2,tostring(fs[n]))
    end
  end

  for i,v in pairs(t1) do
    table.insert(tt,v)
  end
  for i,v in pairs(t2) do
    table.insert(tt,v)
  end 
  return tt,t1,t2
end

function fc(file,file1)--复制文件/文件夹
  local a=string.gmatch(file1,".-%/")
  local file2=""
  for i in a do
    file2=file2..i
    os.execute('mkdir '..file2)
  end
  return(os.execute("cp -r "..file.." "..file1))
end



import "android.content.*"
--导入包

function shb()
  local a=activity.getSystemService(Context.CLIPBOARD_SERVICE).getText()
  --获取剪贴板
  return a
end

function sxb(str) activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(str)
  --写入剪贴板
end


