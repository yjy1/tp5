<?php

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

class Member extends Model
{
    //软删除
    use SoftDelete;

    //关联评论
    public function comments(){
        return $this->hasMany('Comment','member_id','id');
    }

    //注册
    public function register($data)
    {
        //验证输入
        $validate = new \app\common\validate\Member();
        if (!$validate->scene('register')->check($data)) {
            return $validate->getError();
        } else {
            //添加进数据库
            $result = $this->allowField(true)->save($data);

            if ($result) {
                return 1;
            } else {
                return '注册失败';
            }
        }
    }

    //登录
    public function login($data)
    {
        //验证输入
        $validate = new \app\common\validate\Member();
        if (!$validate->scene('login')->check($data)) {
            return $validate->getError();
        } else {
            //
            unset($data['verify']);
            $result = $this->where($data)->find();

            if ($result) {
                $sessionData= [
                    'id'=>$result['id'],
                    'nickname'=>$result['nickname']
                ];
                session('index',$sessionData);
                return 1;
            } else {
                return '用户名或密码错误';
            }
        }
    }

    //添加
    public function add($data)
    {
        //验证输入
        $validate = new \app\common\validate\Member();
        if (!$validate->scene('add')->check($data)) {
            return $validate->getError();
        } else {
            //添加进数据库
            $result = $this->allowField(true)->save($data);

            if ($result) {
                return 1;
            } else {
                return '添加会员失败';
            }
        }
    }

    //编辑会员
    public function edit($data)
    {
        $validate = new \app\common\validate\Member();
        if (!$validate->scene('edit')->check($data)) {
            return $validate->getError();
        }
        else{
            //操作数据库
            //先查询后修改
            $memberInfo= $this->find($data['id']);
            $memberInfo->password= $data['password'];
            $memberInfo->nickname= $data['nickname'];
            $memberInfo->email= $data['email'];
            $result= $memberInfo->save();
            if ($result){
                return 1;
            }else{
                return '编辑会员失败';
            }
        }
    }

}
