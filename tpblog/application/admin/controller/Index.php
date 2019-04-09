<?php

namespace app\admin\controller;

use think\Console;
use think\Controller;
use think\Db;

//控制器
class Index extends Controller
{
    //重复登录过滤
    public function initialize()
    {
        if (session("?admin.id")){
            $this->redirect("admin/home/index");
        }
     }

    //后台登录方法
    public function login()
    {

        if ($this->request->isAjax()) {

            $data = [
                'username' => input("post.username"),
                'password' => input("post.password")
            ];

            //助手函数
            $result = model("Admin")->login($data);
            if ($result == 1) {
                $this->success("登录成功！", url('admin/home/index'));
            } else {
                $this->error($result);
            }
        }
        return $this->fetch();
    }

    //注册方法
    public function a(){
        if (request()->isAjax()) {

//            //接收数据
            $data = [
                'username' => input('post.username'),
                'password' => input('post.password'),
                'conpass' => input('post.conpass'),
                'nickname' => input('post.nickname'),
                'email' => input('post.email')

            ];
//
            $result = model("Admin")->a($data);

            if ($result == 1) {
                $this->success("注册成功！", url("admin/index/login"));
            } else {
                $this->error($result);
            }
        }
        return $this->fetch();
    }

    //找回密码
    public function forget(){
        if (request()->isAjax()){

            $code= mt_rand(1000,9999);
            session('code',$code);
            $result= mailto(input('post.email'),'重置密码验证码',
                '您的重置密码验证码是：'.$code);

            if ($result){
                $this->success("验证码发送成功！");
            }else{
                $this->error("验证码发送失败");
            }
        }
       return  view();
    }

    //test
    public function test(){
        echo phpinfo();
      return view();
    }

}
