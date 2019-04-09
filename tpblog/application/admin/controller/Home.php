<?php

namespace app\admin\controller;

use think\Controller;

class Home extends Base
{
    //后台首页
   public function index(){
        return view();
    }

    //退出
    public function logout()
    {

        session(null);
        if (session('index')) {
            $this->error('退出失败');
        }
        $this->success('退出成功', 'admin/index/login');

    }

}
