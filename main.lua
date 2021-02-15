require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.widget.Toast"
import "android.graphics.Paint"
import "com.androlua.LuaDrawable"
import "android.widget.Toast"
import "android.graphics.Paint"
import "com.androlua.LuaDrawable"
import "android.widget.CircleImageView"
import "android.widget.TextView"
import "android.widget.DrawerLayout"
import "android.widget.ScrollView"
import "android.widget.RelativeLayout"
import "android.widget.LinearLayout"
import "android.widget.ImageView"
import "android.widget.CardView"
import "android.R$id"
import "android.R$animator"
import "android.view.ViewAnimationUtils"
import "android.graphics.BitmapFactory"
import "android.app.NotificationManager"
import "android.graphics.drawable.ColorDrawable"
import "android.R$menu"
import "android.app.AlertDialog"
import "android.R$layout"
import "com.androlua.Ticker"
import "android.view.animation.AccelerateInterpolator"
import "org.w3c.dom.Text"
import "android.app.Notification"
import "android.os.Build"
import "android.content.Intent"
import "android.widget.EditText"
import "android.graphics.Typeface"
import "android.app.NotificationChannel"
import "java.lang.Math"
import "android.app.PendingIntent"
import "com.nirenr.Color"
import "android.graphics.Color"
import "android.content.Context"
import "utils"
import "android.graphics.drawable.ColorDrawable"
import "layout"
import "android.app.NotificationManager"
import "android.graphics.BitmapFactory"
activity.setTheme(android.R.style.Theme_DeviceDefault_Light_DarkActionBar)

activity.setContentView(loadlayout(layout))
if this.getSharedData("qq")=="" or this.getSharedData("qq")==nil then 
  this.setSharedData("qq","3504852205")
end

actionBar = activity.getActionBar()
actionBar.setBackgroundDrawable(San_1)
actionBar.setElevation(dip2px(25))

actionBar.setDisplayHomeAsUpEnabled(true);

actionBar.setHomeAsUpIndicator(android.R.drawable.divider_horizontal_dark)
activity.getWindow().setStatusBarColor(ActionBarColor);
if this.getSharedData("studyTime")==nil then
  this.setSharedData("studyTime",0)
end
function onCreateOptionsMenu(menu,item)
  menu.add("修改个人信息           ").onMenuItemClick= function()activity. newActivity("user") end
  menu.add("关于         ").onMenuItemClick= function()activity. newActivity("about") end

end
function onOptionsItemSelected(item)
  if this.getSharedData("username")~=nil then
    if rawequal(item.getItemId(),android.R.id.home) then
      if DrawerL.isDrawerOpen(3) then
        DrawerL.closeDrawer(3)
       else
        DrawerL.openDrawer(3)
      end
    end
   else
    activity. newActivity("user")
    activity. finish()
  end
end


DrawerL.setDrawerListener(DrawerLayout.DrawerListener{
  onDrawerSlide=function(v,i)
    Progress=i
    San_1.invalidateSelf()
    IsDO=DrawerL.isDrawerOpen(3)
end,})
昵称=this.getSharedData("username") or ""
扣扣=this.getSharedData("qq") or "3504852205"
签名=this.getSharedData("signer") or ""
目标=this.getSharedData("targe") or ""
usernames. setText(昵称)
qqs. setText(扣扣)
signers. setText(签名)
targes. setText("距离 "..目标.." 还有")
import "android.content.Context"
import "android.net.ConnectivityManager"
local wl=activity.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE).getActiveNetworkInfo(); 
if wl~= nil then
  logos.setImageBitmap(loadbitmap("http://q1.qlogo.cn/g?b=qq&nk="..扣扣.."&s=640"))
  else
  Toasts("无法连接到服务器")
end
st.setText("已学习"..this.getSharedData("studyTime").."分钟")
date=this.getSharedData("targetTime")
ti=Ticker()
ti.start()
ti.onTick=function()
  y,m,d,h,t,s=date:match("(%d+)%-(%d+)%-(%d+) (%d+):(%d+):(%d+)")
  time=os.time({
    year=y,
    month=m,
    day=d,
    hour=h,
    min=t,
    sec=s
  })

  time=time-os.time()
  miao.Text=tostring(time%60)
  fen.Text=tostring(time//60%60)
  shi.Text=tostring(time//3600%24)
  tian.Text=tostring(time//86400)
end
one. onClick=function()
  activity. newActivity("keepFocus")
end
two. onClick=function()
  activity. newActivity("simpleClock")
end
swe. onClick=function()
  todoLayout={
    LinearLayout;
    orientation="vertical";
    layout_width="fill";
    background="#F0F0F0";
    id="tv";
    {
      CardView;
      background="#FFFFFF";
      CardElevation="0dp";
      radius="10";
      layout_width="-1";
      layout_margin="5dp";
      {
        LinearLayout;
        orientation="vertical";
        layout_width="fill";
        layout_height="fill";
        {
          TextView;
          textSize="16sp";
          text="学习计划";
          padding="5dp";
          textColor= ActionBarColor;
          Typeface=Typeface.defaultFromStyle(Typeface.BOLD);
          
        };
        {
          TextView;
          padding="5dp";
          text=[==[在下面输入你接下来想做的事，或者某一个任务的工作步骤，我们将这些内容投送到通知栏里，这样当你忘记某个步骤时，你可以通过下拉菜单来看到你若记录的步骤。
当某一项任务完成时，你可以通过右滑清楚任务。]==];
        };
      };
    };
    {
      CardView;
      background="#FFFFFF";
      CardElevation="0dp";
      radius="10";
      layout_width="-1";
      layout_margin="5dp";
      {
        EditText;
        background="#00000000";
        singleLine=true;
        padding="10dp";
        textColor="#FF000000";
        hint="标题";
        layout_width="fill";
        textSize="14dp";
        id="title";
      };
    };
    {
      CardView;
      background="#FFFFFF";
      CardElevation="0dp";
      radius="10";
      layout_width="-1";
      layout_margin="5dp";
      {
        EditText;
        background="#00000000";
        singleLine=true;
        padding="10dp";
        textColor="#FF000000";
        hint="内容";
        layout_width="fill";
        textSize="14dp";
        id="conc";
      };
    };
    {
      LinearLayout;
      layout_height="fill";
      layout_width="fill";
      gravity="end";
      layout_marginTop="30dp";
    };
  };
  AlertDialog.Builder(this)
  .setView(loadlayout(todoLayout))
  .setPositiveButton("投放",{onClick=function(v)
      import "android.content.*"
      intent = Intent()
      mNManager = activity.getSystemService(Context.NOTIFICATION_SERVICE)
      pendingIntent = PendingIntent.getActivity(activity, 0, intent, 0)
        builder= Notification.Builder(this);
      --设置标题
      builder.setContentTitle(title. Text);
      --设置内容
      builder.setContentText(conc. Text);
      --设置状态栏显示的图标，建议图标颜色透明
      builder.setSmallIcon(R.drawable.icon)
      --设置通知灯光（LIGHTS）、铃声（SOUND）、震动（VIBRATE）、（ALL 表示都设置）
      builder.setDefaults(Notification.DEFAULT_ALL)
      --灯光三个参数，颜色（argb）、亮时间（毫秒）、暗时间（毫秒）,灯光与设备有关
      builder.setLights(Color.RED, 200, 200)
      --铃声,传入铃声的 Uri（可以本地或网上）我这没有铃声就不传了
      --builder.setSound(Uri.parse("")) ;
      --震动，传入一个 long 型数组，表示 停、震、停、震 ... （毫秒）
      --builder.setVibrate([0, 200, 200, 200, 200, 200])
      --通知栏点击后自动消失
      builder.setAutoCancel(true);
      --简单通知栏设置 Intent
      builder.setContentIntent(pendingIntent);
      builder.setPriority(Notification.PRIORITY_HIGH);

      --设置下拉之后显示的图片
      builder.setLargeIcon(BitmapFactory.decodeResource(activity.getResources(), R.drawable.icon));

      if Build.VERSION.SDK_INT >= Build.VERSION_CODES.O then
        channel = NotificationChannel("5996773", "安卓10a", NotificationManager.IMPORTANCE_HIGH);
        channel.enableLights(true);--是否在桌面icon右上角展示小红点
        channel.setLightColor(Color.GREEN);--小红点颜色
        channel.setShowBadge(true); --是否在久按桌面图标时显示此渠道的通知
        mNManager.createNotificationChannel(channel);
      end
      notification=builder.build();
      mNManager.notify(math. random(1,999),notification);
  end})
  .setNegativeButton("取消",nil)
  .show()
end

fou. onClick= function()
  activity. newActivity("calcu")
end
five. onClick= function()
  activity. newActivity("askMe")
end
six. onClick= function()
  activity. newActivity("scienceValue")
end
welcomeBoared. onClick= function()
  welcomeText. setText( welcome[ math. random(1,#welcome)])
end



import "android.view.animation.*"
import "java.lang.Math"
import "android.view.*"
import "com.androlua.Ticker"
ttt=Ticker()--计时器
ttt.Period=100
ttt.start()
ttt.onTick=function()
  ttt.stop()
  animator = ViewAnimationUtils.createCircularReveal(DrawerL,0,0,0,Math.hypot(DrawerL.getWidth(), DrawerL.getHeight()));
  animator.setInterpolator(AccelerateInterpolator());
  animator.setDuration(2000);
  animator.start();
end

welcome={"欢迎来到学吧！",
         "何须浅碧深红色，自是花中第一流。",
         "别来无恙，你在心上。",
         "努力优秀！","落花人独立,微雨燕双飞","各自努力，最高处见！","同是寒窗苦读，怎能甘拜下风","努力只能及格，拼命才能优秀。","哪朵玫瑰没有荆棘"}
welcomeBoared.setBackgroundDrawable(ColorDrawable(ActionBarColor)) 

--[=[[(文本0)="说明：该applet用于计算三个元素的加法"
(文本1)="[[二元一次方程构造式
 a1X+b1Y=c1
 a2X+b2Y=c2
  ]]"
(编辑框1)="请输入a1"
(编辑框2)="请输入b1"
(编辑框3)="请输入c1"
(编辑框4)="请输入a2"
(编辑框5)="请输入b2"
(编辑框6)="请输入c2"
(按钮1)="计算X"
(编辑框7)="结果"

(点击-按钮1)="编辑框7=(编辑框5*编辑框1-编辑框2*编辑框6)/(编辑框1*编辑框5-编辑框4*编辑框2)"
]==]




