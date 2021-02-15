require "import"
import "android.widget.*"
import "android.view.*"
import "android.widget.*"
import "android.view.*"
import "utils"
activity.setTheme(android.R.style.Theme_DeviceDefault_Light_DarkActionBar)

layout={
  LinearLayout;
  background="#F0F0F0";
  orientation="vertical";
  id="tv";
  layout_width="fill";
  {
    CardView;
    background="#FFFFFF";
    layout_width="-1";
    layout_margin="5dp";
    
    radius="10";
    CardElevation="0dp";
    {
      EditText;
      background="#00000000";
      id="edit";
      singleLine=true;
      hint="输入你要查找的概念，例如：狄拉克方程";
      textSize="14dp";
      padding="10dp";
      textColor="#FF000000";
    };
    {
      LinearLayout;
      layout_gravity="end";
      backgroundColor=ActionBarColor;
      layout_height="match_parent";
      {
        Button;
        text="查询",
        textColor=0xFFFFFFFF,
        background="0";
        id="search";
      };
    };
  };
  {
    CardView;
    layout_margin="5dp";
    layout_height="match_parent";
    layout_width="match_parent";
    CardElevation=0;
    {
      LinearLayout;
      layout_width="match_parent";
      layout_height="match_parent";
      {
        ScrollView;
        layout_width="match_parent";
        layout_height="match_parent";
        {
          LinearLayout;
          layout_width="match_parent";
          layout_height="match_parent";
          {
            TextView;
             id="contact";
            layout_width="match_parent";
            layout_margin="10dp";
            layout_height="match_parent";
            textSize="23sp";
            textColor=ActioColor,
          };
        };
      };
    };
  };
};


activity.setContentView(loadlayout(layout))




actionBar = this.getActionBar();
actionBar.setBackgroundDrawable(San_1)
actionBar.setElevation(dip2px(25))
actionBar. setTitle("学习通")
actionBar.setDisplayHomeAsUpEnabled(true);
actionBar.setHomeAsUpIndicator(android.R.drawable.divider_horizontal_dark)
activity.getWindow().setStatusBarColor(ActionBarColor);
function onOptionsItemSelected(item)
  Toasts("有问必答！")
end
search. onClick= function()
  url="https://wapbaike.baidu.com/item/"..edit.Text
Http.get(url,function(code,body)
  if code==200 then
    result=""
    pcall(function()result=body:match([[data%-pid%="p%-0">(.-)</div>]]):gsub("<(.-)>",""):gsub("<(.+)",""):gsub("%[(.-)%]","")    
    end)
    contact.setText(result)
   else
    contact.setText("俺不知道π_π")
  end
end)
   end
