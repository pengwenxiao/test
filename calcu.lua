require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import"ku/ku"
import "android.widget.Toast"
import "com.androlua.LuaDrawable"
import "android.graphics.Paint"
import "android.widget.LinearLayout"
import "android.R$menu"
import "android.widget.ListView"
import "android.widget.TextView"
import "com.androlua.LuaAdapter"
import "android.graphics.Typeface"
import "android.R$id"
import "android.widget.ImageView"
import "android.widget.CardView"
import "android.R$layout"
import "utils"
activity.setTitle('高级运算')
activity.setTheme(android.R.style.Theme_DeviceDefault_Light_DarkActionBar)

--activity.setTheme(android.R.style.Theme_Holo_Light)
actionBar = activity.getActionBar()
actionBar.setBackgroundDrawable(San_1)
actionBar.setElevation(dip2px(25))
--先显示返回按钮
actionBar.setDisplayHomeAsUpEnabled(true);
--给返回按钮设置一个看不见的系统资源
actionBar.setHomeAsUpIndicator(android.R.drawable.divider_horizontal_dark)
--现在返回按钮从视觉上看是消失了那么他就多了一个标题与边缘的距离
activity.getWindow().setStatusBarColor(ActionBarColor);
main={
  LinearLayout;
  orientation="vertical";
  {
    CardView;
    layout_margin="5dp";
    layout_width="-1";
    background="#FFFFFF";
    CardElevation="0dp";
    radius="10";
    {
      LinearLayout;
      orientation="vertical";
      layout_width="fill";
      background="#FFFFFF";
      layout_height="fill";
      {
        TextView;
        textSize="16sp";
        padding="10dp";
        text="关于";
        textColor= ActionBarColor;
      };
      {
        TextView;
        text=[==[下面是我们为你写好的一些Applet，他可以解决一些简单问题。当然，你可以通过自己编写脚本来设计适合自己的解决方案
该脚本为我们自主设计，全中文，因此编写起来很容易，你可以点击右上角帮助来学习他。

注:长按可以编辑脚本，你可以通过我们官方提供的Applet进行学习
点击右上角可以新建Applet和查看帮助]==];
        padding="10dp";
      };
    };
  };
  {
    ListView;
    DividerHeight=0;
    layout_height="-1";
    layout_width="-1";
    id="list1";
  };
};

activity.setContentView(loadlayout(main))
路径=activity.getLuaDir().."/applet/"


layout=
{
  LinearLayout;
  orientation="vertical";
  layout_width="fill";
  background="#FFF1F1F1";
  
  {
    CardView;
    background="#FFF1F1F1";
    CardElevation="0dp";
    radius="25";
    layout_width="-1";
    layout_margin="10dp";
    {
      LinearLayout;
      {
        ImageView;
        id="iv";
        layout_width="50sp";
        layout_height="50sp";
        src="Code74.png";
      };
      {
        LinearLayout;

        {
          TextView;
          text="";
          layout_marginLeft="10sp";
          textSize="18sp";
          id="tv";
          Typeface=Typeface.defaultFromStyle(Typeface.BOLD);
          textColor= ActionBarColor;
        };
        {
          TextView;
          layout_marginLeft="20sp";
          id="tv1";
          textSize="11sp";
          textColor="#ff777777";
          text="";
        };

        orientation="vertical";
      };
      layout_width="-1";
      orientation="horizontal";
      gravity="center|left";
    };
  };
};



adp1=LuaAdapter(activity,layout)

刷新=function()
  _,_,脚本列表=fl(路径)
  adp1.clear()
  for i,v in ipairs(脚本列表) do

    adp1.add{tv=v:match("%/(.[^/]+)$"),tv1=v}
  end
end
刷新()

list1.Adapter=adp1
list1.onItemClick=function(parent, v, pos,id)
  activity.newActivity("js",{v.Tag.tv1.Text})
end

list1.onItemLongClick=function(parent, v, pos,id)
  activity.newActivity("xinjian",{v.Tag.tv1.Text})
  return true
end


function onCreateOptionsMenu(menu)
  menu.add("新建").onMenuItemClick=function(a)
    activity.newActivity("xinjian")
  end
  menu.add("帮助").onMenuItemClick=function(a)
    Toasts("长按编辑计算界面")
  end
end



function onResult(...)
  刷新()
end
