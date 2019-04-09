<?php

namespace app\common\model;

use think\App;
use think\Model;
use think\model\concern\SoftDelete;

class Admin extends Model
{
    //软删除
    use SoftDelete;

    //登录校验
    public function login($data)
    {
        $validate = new \app\common\validate\Admin();
        if (!$validate->scene("login")->check($data)) {
            return $validate->getError();
        }

        $result = $this->where($data)->find();
        if ($result) {

            //判断用户状态
            if ($result['status'] == 1) {
                //存储session
                $sessionData = [
                    'id' => $result['id'],
                    'username' => $result['username'],
                    'nickname' => $result['nickname'],
                    'is_super' => $result['is_super']
                ];
                //助手函数
                session("admin", $sessionData);

                //1表示用户名和密码正确
                return 1;
            } else {
                return "您已被禁用";
            }

        } else {
            return '用户名或密码错误！';
        }

    }

    //注册校验
    public function a($data)
    {

        $validate = new \app\common\validate\Admin();
        if (!$validate->scene("a")->check($data)) {
            return $validate->getError();
        }

        else{
            //写入数据库
            $result= $this->allowField(true)->save($data);
            if ($result){
                //发送邮件
                //mailto($data['email'],'注册管理员账户成功','注册管理员账户成功');
                return 1;
            }else{
                return "注册失败";
            }

        }

    }


    //添加管理员
    public function add($data)
    {
        //验证输入
        $validate = new \app\common\validate\Admin();
        if (!$validate->scene('add')->check($data)) {
            return $validate->getError();
        } else {
            //添加进数据库
            $result = $this->allowField(true)->save($data);

            if ($result) {
                return 1;
            } else {
                return '添加管理员失败';
            }
        }
    }

    //编辑管理员
    public function edit($data)
    {
        $validate = new \app\common\validate\Admin();
        if (!$validate->scene('edit')->check($data)) {

             return $validate->getError();
        }
        else{
        //操作数据库
        //先查询后修改
        $adminInfo= $this->find($data['id']);
        $adminInfo->password= $data['password'];
        $adminInfo->nickname= $data['nickname'];
        $adminInfo->email= $data['email'];
        $result= $adminInfo->save();
        if ($result){
            return 1;
        }else{
            return '修改管理员失败';
        }
         }
    }

}
