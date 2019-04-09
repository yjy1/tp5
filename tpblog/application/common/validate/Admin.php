<?php


namespace app\common\validate;


use think\Validate;

class Admin extends Validate
{
    protected $rule = [
        "username|管理员账户" => "require",
        "password|密码" => "require",
        "conpass|确认密码" => "require|confirm:password",
        "nickname|昵称" => "require",
        "email|邮箱" => "require|email|unique:admin",

        //栏目
        'catename' => 'require',
        'sort'=> 'require'
    ];

    //登录验证场景
    public function sceneLogin()
    {
        return $this->only(['username', 'password']);
    }


    //注册验证场景
    public function sceneA()
    {

        return $this->only(['username','password','conpass','nickname','email'])
           ->append("username","unique:admin");

    }

    //栏目添加验证场景
    public function sceneCateAdd(){
        return $this->only(['catename','sort']);
    }

//*********************************************
    //添加管理员场景
    public function sceneAdd(){
        return $this->only([
            'username','password','conpass','nickname','email'
        ]);
    }

    //编辑管理员场景
    public function sceneEdit(){

        return $this->only([
             'password','conpass','nickname','email'
        ]);
    }

}