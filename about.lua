require "import"
import "android.widget.*"
import "android.view.*"
import "utils"
import "android.app.*"
import "com.androlua.LuaDrawable"
import "android.graphics.Paint"
import "android.widget.Toast"
import "android.widget.RelativeLayout"
import "android.graphics.ColorFilter"
import "android.widget.TextView"
import "org.w3c.dom.Text"
import "android.widget.CircleImageView"
import "android.widget.ScrollView"
import "android.graphics.Typeface"
import "android.R$layout"
import "android.R$id"
import "android.widget.LinearLayout"
import "android.widget.ImageView"
import "android.widget.CardView"
activity.setTheme(android.R.style.Theme_DeviceDefault_Light_DarkActionBar)

actionBar = this.getActionBar();
actionBar.setBackgroundDrawable(San_1)
actionBar.setElevation(dip2px(25))
actionBar. setTitle("关于学吧")
actionBar.setDisplayHomeAsUpEnabled(true);
--给返回按钮设置一个看不见的系统资源
actionBar.setHomeAsUpIndicator(android.R.drawable.divider_horizontal_dark)
--现在返回按钮从视觉上看是消失了那么他就多了一个标题与边缘的距离
activity.getWindow().setStatusBarColor(ActionBarColor);
layout={
  LinearLayout;
  layout_height="-1";
  orientation="vertical";
  layout_width="-1";
  id="_root";
  {
    RelativeLayout;
    layout_width="-1";
    layout_height="-1";
    {
      LinearLayout;
      layout_height="-1";
      layout_width="-1";
      orientation="vertical";
      {
        ScrollView;
        layout_height="-1";
        id="obs_1";
        layout_width="-1";
        overScrollMode=2;
        {
          LinearLayout;
          layout_height="-1";
          layout_width="-1";
          orientation="vertical";
          {
            CardView;
            layout_height="-2";
            layout_margin="8dp";
            CardElevation="0";
            layout_width="-1";
            background="#ffffffff";
            {
              LinearLayout;
              layout_height="200dp";
              layout_width="-1";
              background="#ffffffff";
              {
                ImageView;
                layout_height="-1";
                id="pho_top";
                scaleType="centerCrop";
                layout_width="-1";
                src="about/res/hphoto";
              };
            };
            {
              CardView;
              CardElevation="0";
              layout_width="-1";
              layout_height="fill";
              {
                LinearLayout;
                layout_height="-1";
                id="cv1_lay";
                orientation="vertical";
                background="#ffffffff";
                layout_width="-1";
                padding="16dp";
                {
                  LinearLayout;
                  background="#ffffffff";
                  orientation="horizontal";
                  layout_width="fill";
                  gravity="center";
                  {
                    CircleImageView;
                    src="icon.png";
                  };
                };
                {
                  LinearLayout;
                  background="#ffffffff";
                  layout_gravity="center";
                  layout_width="fill";
                  gravity="center";
                  {
                    TextView;
                    text="学吧 Version : 1.1";
                    Typeface=Typeface.defaultFromStyle(Typeface.BOLD);
                    textColor=ActionBarColor;
                    textSize="23sp";
                    layout_marginTop="10dp";
                  };
                };
              };
            };
          };
          {
            CardView;
            layout_height="30%h";
            layout_margin="8dp";
            layout_width="-1";
            CardElevation="0";
            {
              LinearLayout;
              layout_height="-1";
              id="ay_1";
              orientation="vertical";
              padding="16dp";
              layout_width="-1";
              background="#ffffffff";
              {
                TextView;
                Text="开发相关";
                textColor=ActionBarColor;
                textSize="18sp";
                Typeface=Typeface.defaultFromStyle(Typeface.BOLD);

              };
              {
                CardView;
                layout_height="150dp";
                id="back";
                background="#ffffffff";
                radius=15;
                layout_width="fill";
                CardElevation="0";
                {
                  CircleImageView;
                  layout_height="80dp";
                  layout_marginTop="35dp";
                  layout_gravity="left";
                  layout_marginLeft="10dp";
                  src="image/me.jpg";
                  layout_width="80dp";
                  id="logo";
                };
                {
                  TextView;
                  textSize="18sp";
                  layout_marginTop="30dp";
                  text="Whistle";
                  Typeface=Typeface.defaultFromStyle(Typeface.BOLD);
                  textColor=ActionBarColor;
                  layout_marginLeft="110dp";
                };
                {
                  TextView;
                  layout_marginRight="10dp";
                  text=[==[
QQ:3504852205
博客:pengwenxiao.top]==];
                  layout_marginLeft="110dp";
                  layout_marginTop="60dp";
                  textSize="14sp";
                };
              };
            };
          };
          {
            CardView;
            layout_height="-2";
            layout_margin="8dp";
            background="#ffffffff";
            layout_width="-1";
            CardElevation="0";
            {
              LinearLayout;
              layout_height="-1";
              orientation="vertical";
              layout_width="-1";
              padding="16dp";
              {
                LinearLayout;
                layout_height="-1";
                gravity="center";
                orientation="vertical";
                layout_width="-1";
                id="cv2_lay";
                {
                  LinearLayout;
                  orientation="horizontal";
                  gravity="center|left";
                  padding="15dp";
                  layout_gravity="center";
                  layout_width="fill";
                  onClick=function()
                    ss = SpannableString("QQ:3504852205\n\n\n知乎主页:https://www.zhihu.com/people/7e83e1b7faec0b47a2f992ef007139bd\n\n\n网易云主页:http://music.163.com/m/user/home?id=1393620691");
                    ss.setSpan(URLSpan("3504852205"),3,13,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                    ss.setSpan(URLSpan("https://www.zhihu.com/people/7e83e1b7faec0b47a2f992ef007139bd"),21,82,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                    ss.setSpan(URLSpan("http://music.163.com/m/user/home?id=1393620691"),91, 137,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                    AlertDialog.Builder(this)
                    .setTitle("联系方式")
                    .setMessage(ss)
                    .setPositiveButton("确定",nil)
                    .show()
                  end,
                  id="lifeBack";
                  {
                    ImageView;
                    layout_height="4.1%h";
                    ColorFilter=ActionBarColor;
                    src="image/main/menu.png";
                    layout_width="4.1%h";
                    id="lifeImage";
                  };
                  {
                    LinearLayout;
                    orientation="vertical";
                    layout_marginLeft="7%w";
                    {
                      TextView;
                      text="联系作者";
                      textSize="15sp";
                      id="lifeText";
                    };
                    {
                      TextView;
                      text="";
                      visibility=8;
                    };
                  };
                  {
                    ImageView;
                    layout_height="4.1%h";
                    layout_marginLeft="50%w";
                    rotation=-90;
                    -- src="image/down.png";
                    layout_width="4.1%h";
                    ColorFilter=4285887861;
                  };
                };
                {
                  LinearLayout;
                  orientation="horizontal";
                  gravity="center|left";
                  padding="15dp";
                  layout_gravity="center";
                  layout_width="fill";
                  onClick=function()
                    import "android.content.Intent"
                    import "android.net.Uri"
                    intent = Intent("android.intent.action.VIEW")
                    intent .setData(Uri.parse( "market://details?id="..activity.getPackageName()))
                    this.startActivity(intent)
                  end,
                  id="lifeBack";
                  {
                    ImageView;
                    layout_height="4.1%h";
                    src="image/main/ping.png";
                    layout_width="4.1%h";
                    ColorFilter=ActionBarColor;
                    id="lifeImage";
                  };
                  {
                    LinearLayout;
                    orientation="vertical";
                    layout_marginLeft="7%w";
                    {
                      TextView;
                      text="给我评分";
                      textSize="15sp";
                      id="lifeText";
                    };
                    {
                      TextView;
                      text="";
                      visibility=8;
                    };
                  };
                  {
                    ImageView;
                    layout_height="4.1%h";
                    layout_marginLeft="50%w";
                    rotation=-90;
                    --src="image/down.png";
                    layout_width="4.1%h";
                    ColorFilter=4285887861;
                  };
                };
                {
                  LinearLayout;
                  orientation="horizontal";
                  gravity="center|left";
                  padding="15dp";
                  layout_gravity="center";
                  layout_width="fill";
                  onClick=function()
                    import "android.net.Uri"
                    import "android.content.Intent"
                    url="mqqapi://card/show_pslcard?src_type=internal&version=1&uin=836949369&card_type=group&source=qrcode"
                    activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))

                  end
                  ,
                  id="lifeBack";
                  {
                    ImageView;
                    layout_height="4.1%h";
                    ColorFilter=ActionBarColor;
                    src="image/main/account.png";
                    layout_width="4.1%h";
                    id="lifeImage";
                  };
                  {
                    LinearLayout;
                    orientation="vertical";
                    layout_marginLeft="7%w";
                    {
                      TextView;
                      text="加群交流";
                      textSize="15sp";
                      id="lifeText";
                    };
                    {
                      TextView;
                      text="";
                      visibility=8;
                    };
                  };
                  {
                    ImageView;
                    layout_height="4.1%h";
                    layout_marginLeft="50%w";
                    rotation=-90;
                    -- src="ima|ge/down.png";
                    layout_width="4.1%h";
                    ColorFilter=4285887861;
                  };
                };
              };
            };
          };
          {
            CardView;
            CardElevation="0";
            background="#ffffffff";
            layout_width="-1";
            layout_margin="8dp";
            {
              LinearLayout;
              layout_height="-1";
              orientation="vertical";
              layout_width="-1";
              padding="16dp";
              {
                TextView;
                Text="说明";
                textColor=ActionBarColor;
                Typeface=Typeface.defaultFromStyle(Typeface.BOLD);

                textSize="18sp";
              };
              {
                TextView;
                layout_margin="5dp";
                textSize="14sp";
                Text="学吧是一款学习效率类App, 涵盖了多方面提高学习效率的功能，诸如保持专注，简便计算，临时时钟，资料查询，且这些功能与同类软件相比有诸多创新之处，具体内容我会在论文中给出。";
              };
            };
          };
        };
      };
    };
    {
      LinearLayout;
      layout_height="-2";
      id="_topbar";
      orientation="vertical";
      layout_width="-1";
      elevation="4dp";
      {
        TextView;
        layout_width="-1";
      };
    };
  };
};

activity.setContentView(loadlayout(layout))

