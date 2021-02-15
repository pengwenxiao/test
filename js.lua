require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import"ku/ku"
import "android.graphics.drawable.ColorDrawable"
import "utils"
activity.setTheme(android.R.style.Theme_DeviceDefault_Light_DarkActionBar)
function Split(szFullString, szSeparator)
  local nFindStartIndex = 1
  local nSplitIndex = 1
  local nSplitArray = {}
  while true do
    local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
    if not nFindLastIndex then
      nSplitArray[nSplitIndex] =  tonumber(string.sub(szFullString, nFindStartIndex, string.len(szFullString)))
      break
    end
    nSplitArray[nSplitIndex] = tonumber(string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)) nFindStartIndex = nFindLastIndex + string.len(szSeparator)
   print(nSplitArray[nSplitIndex])
    nSplitIndex = nSplitIndex + 1
  end
  return nSplitArray
end 
function sum(a) r=0 for i,v in ipairs(Split(a,"#")) do   r = tonumber(r) +tonumber (v) end return tonumber(r) end
function ave(...) return sum({...})/(#{...}) end

脚本路径=...
if Build.VERSION.SDK_INT >= 21 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(ActionBarColor);
end
activity.setTitle((脚本路径):match("%/(.[^/]+)$"))
actionBar = activity.getActionBar()
actionBar.setBackgroundDrawable(ColorDrawable(ActionBarColor))
actionBar.setElevation(dip2px(25))
配置=fr(脚本路径)
layout={
  LinearLayout;
  orientation="vertical";
  {
    ScrollView;
    layout_height="-1";
    layout_width="-1";
    {
      LinearLayout;
      layout_width="-1";
      orientation="vertical";
    };
  };
};

for i,v in 配置:gmatch('%((.-)%) ?= ?%"(.-)%"') do
  print(i,v)
  if i:find("^编辑框") then
    table.insert(layout[2][2],{
      CardView,
      background="#FFFFFF",
      layout_margin="5dp",
      radius="10",
      layout_width="-1",
      CardElevation="0dp",
      {
        EditText,
        background="#00000000",
        id=i,
        textColor="#FF000000",
        singleLine=true,
        padding="10dp",
        layout_width="fill",
        hint=v,
        textSize="14dp",
      },
    })
  end
  if i:find("^点击") then
    local a=i:match("%-(.+)")..[[=function()
    ]]..v:gsub("%=(.+)$",function(s)
      return ".Text=tostring("..s:gsub("[\128-\254%P]+",function(s)
        if s:find("编辑框") then
          return "tonumber("..s..".Text)"
         else
          return s
        end
      end)..")"
    end)..[[
    end]]
    sxb(a)
    loadstring(a)()
  end
  if i:find("^按钮") then
    table.insert(layout[2][2],{Button,
      onClick=i,
      layout_width="-1",
      background="0",
      textColor= ActionBarColor,
      text=v})
  end
  if i:find("^文本") then
    table.insert(layout[2][2],{TextView,
      id=i,
      layout_margin="5dp",
      textColor=ActionBarColor,
      text=v})
  end
end

js={
  LinearLayout;
  orientation="vertical";
  {
    ScrollView;
    layout_width="-1";
    layout_height="-1";
    {
      LinearLayout;
      layout_width="-1";
    };
  };
};
activity.setContentView(loadlayout(layout))




