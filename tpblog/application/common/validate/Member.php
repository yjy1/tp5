<?php


namespace app\common\validate;


use think\Validate;

class Member extends Validate
{
    //规则
    protected $rule= [
        'username|会员名称'=>'require',
        'password|密码'=>'require',
        'conpass|确认密码'=>'require|confirm:password',
        'nickname|昵称'=>'require',
        'email|邮箱'=>'require|email',
        'verify|验证码'=> 'require|captcha'
    ];

    //登录场景
    public function sceneLogin(){
        return $this->only([
            'username','password','verify'
        ]);
    }

    //注册场景
    public function sceneRegister(){
        return $this->only([
            'username','password','conpass','nickname','email','verify'
        ]);
    }

    //添加会员场景
    public function sceneAdd(){
        return $this->only([
            'username','password','conpass','nickname','email'
        ]);
    }

    //编辑会员场景
    public function sceneEdit(){

        return $this->only([
            'password','conpass','nickname','email'
        ]);
    }
}