require "import"
import "android.widget.*"
import "android.view.*"
import "android.widget.*"
import "android.view.*"
import "utils"
import "android.app.*"
local startTime=System.currentTimeMillis()
actionBar = this.getActionBar();
actionBar.setBackgroundDrawable(San_1)
actionBar.setElevation(dip2px(25))
actionBar. setTitle("保持专注")
actionBar.setDisplayHomeAsUpEnabled(true);
--给返回按钮设置一个看不见的系统资源
actionBar.setHomeAsUpIndicator(android.R.drawable.divider_horizontal_dark)
--现在返回按钮从视觉上看是消失了那么他就多了一个标题与边缘的距离
activity.getWindow().setStatusBarColor(ActionBarColor)
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
activity.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_HIDE_NAVIGATION|View.SYSTEM_UI_FLAG_IMMERSIVE)
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED);
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD);
activity.setTheme(android.R.style.Theme_DeviceDefault_Light_DarkActionBar)

layout={
  LinearLayout;
  layout_height="fill";
  orientation="vertical";
  layout_width="match_parent";
  {
    LinearLayout;
    layout_height="20%h";
    layout_width="match_parent";
    gravity="center";
    backgroundColor=ActionBarColor;
    {
      TextView;
      Typeface=Bold;
      textColor=0xFFFFFFFF;
      id="say",
      textSize="20sp";
      text="请点击下面按钮设置你想保持专注的时间";
    };
  };
  {
    LinearLayout;
    layout_height="match_parent";
    orientation="vertical";
    layout_width="match_parent";
    {
      LinearLayout;
      layout_height="match_parent";
      orientation="vertical";
      layout_width="match_parent";
      {
        LinearLayout;
        layout_height="30%h";
        orientation="vertical";
        gravity="center|bottom";
        layout_width="match_parent";
        {
          TextView;
          Typeface=Bold;
          textColor="#FF795543";
          layout_gravity="center|bottom";
          textSize="28sp";
          text="";
        };
      };
      {
        LinearLayout;
        layout_height="10%h";
        layout_width="match_parent";
        gravity="center";
        {
          TextView;
          Typeface=Bold;
          textSize="40sp";
          id="fen";
          textColor="#FF795543";
          text="00";
        };
        {
          TextView;
          Typeface=Bold;
          textSize="10sp";
          textColor="#FF795543";
          text="m";
        };
        {
          TextView;
          Typeface=Bold;
          textColor="#FF795543";
          id="mia";
          textSize="40sp";
          text="00";
        };
        {
          TextView;
          Typeface=Bold;
          textColor="#FF795543";
          textSize="10sp";
          text="s";
        };
      };
      {
        LinearLayout;
        layout_height="40%h";
        orientation="vertical";
        layout_width="match_parent";
        {
          TextView;
          Typeface=Bold;
          textColor="#FF795543";
          layout_gravity="center|top";
          textSize="28sp";
         -- text="再把他们拿出来";
        };
        {
          Button;
          Typeface=Bold;
          textColor="#FF795543";
          textSize="18sp";
          backgroundColor="#ffffeb3c";
          layout_gravity="center";
          text="设置";
          id="ok";
         -- layout_marginTop="20%h";
        };
      };
    };
  };
};
activity.setContentView(loadlayout(layout))
ok. onClick= function()
  NumLayout={
  LinearLayout;
  layout_width="fill";
  layout_height="fill";
  orientation="vertical";
  {
    TextView;
    layout_gravity="center";
    text="请拨动滚轮选择你想专注的时间";
    textSize="20sp";
    layout_margin="7dp";
  };
  {
    LinearLayout;
    layout_width="match_parent";
    gravity="center";
    {
      NumberPicker;
      MaxValue=600;
      MinValue=0;
       id="hour",
    };
    {
      TextView;
      layout_margin="5dp";
      text="分";
    };
    {
      NumberPicker;
      MaxValue=60;
      id="minu",
      MinValue=0;
    };
    {
      TextView;
      layout_margin="5dp";
      text="秒";
    };
  };
};


  AlertDialog.Builder(this)
  .setView(loadlayout(NumLayout))
  .setPositiveButton("确定",{onClick=function(v)
    local  sleeptime=(tonumber(hour. getValue())*60+tonumber(minu. getValue()))
  f=sleeptime
d=f--赋值
e=f--赋值
ti=Ticker()
if d>=60 then--判断小时，大于一分钟转换
  d,e=d//60,e%60
 else--小于一分钟直接显示秒数
  d,e=0,d
end
ti.Period=1000
ti.onTick=function()
  if e==0 then--秒数为零判断
    d,e=d-1,60
   else
    e=e-1
    fen.Text=tostring(d)
    mia.Text=tostring(e)
  end
  if d==0 and e==0 then--分钟秒数都为零结束计时
    ti.stop()
    ok.setVisibility(View.VISIBLE)
    播放音频(activity.getLuaDir().."/alarme.mp3")
    img = ImageView(this);
img.setImageBitmap(loadbitmap(activity. getLuaDir().."/sure.png"))
AlertDialog.Builder(this)
.setTitle("恭喜你！")
.setView(img)
.setPositiveButton("确定",{onClick= function()activity. finish() end})
.show();
   else
    -- print("二"..d..":"..e)
    if e==0 then
      d,e=d-1,60
     else
      -- print("三"..d..":"..e)
    end
  end
end

--启动Ticker定时器
ti.start()
ok.setVisibility(View.GONE)
say. setText("正在专注中.....")
  end})
  .setNegativeButton("取消",nil)
  .show()
   end
 
 
import "android.media.MediaPlayer"

local 音频播放器=MediaPlayer()
function 播放音频(路径)
  音频播放器.reset()
  .setDataSource(路径)
  .prepare()
  .start()
  .setOnCompletionListener({
    onCompletion=function()
      Toasts("挑战成功")
    end})
end

function onDestroy()
  local endTime=System.currentTimeMillis()
  ti.stop()
  local delay= Math.floor((endTime-startTime)/60000)+1
    this.setSharedData("studyTime",tonumber(this.getSharedData("studyTime"))+delay)
end


参数=0
function onKeyDown(code,event) 
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then 
    if 参数+2 > tonumber(os.time()) then 
      activity.finish()
      Toast.makeText(activity,"挑战失败！" , Toast.LENGTH_SHORT )
      
    else
      Toast.makeText(activity,"不要半途而废哦(´-ω-`)" , Toast.LENGTH_SHORT )
      .show()
      参数=tonumber(os.time()) 
    end
    return true 
  end
end
