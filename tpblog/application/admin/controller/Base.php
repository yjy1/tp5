<?php

namespace app\admin\controller;

use think\Controller;

class Base extends Controller
{
    //初始化方法
    public function initialize()
    {
        //判断账户是否已登录
        if (!session("?admin.id")){
            $this->redirect("admin/index/login");
        }
    }
}
