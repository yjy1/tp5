<?php

namespace app\admin\controller;

use think\Controller;

class Admin extends Base
{
    //管理员列表
    public function list1()
    {

        //查出所有管理员
        $adminInfo = model('Admin')->order('create_time', 'desc')->paginate(6);
        $viewData = [
            'admins' => $adminInfo
        ];
        $this->assign($viewData);

        //get
        return view();
    }

    //管理员添加
    public function add()
    {

        if (request()->isAjax()) {
            $data = [
                'username' => input('post.username'),
                'password' => input('post.password'),
                'conpass' => input('post.conpass'),      //确认不能添加进数据库
                'nickname' => input('post.nickname'),
                'email' => input('post.email')
            ];

            //验证
            $result = model('Admin')->add($data);

            if ($result == 1) {
                $this->success('添加管理员成功', 'admin/admin/list1');
            } else {
                $this->error($result);
            }
        }
        //视图 get
        return view();
    }

    //编辑管理员
    public function edit()
    {

        if (request()->isAjax()) {
            $data = [
                'id' => input('post.id'),
                'password' => input('post.password'),
                'conpass' => input('post.conpass'),
                'nickname' => input('post.nickname'),
                'email' => input('post.email')
            ];
            $result = model('admin')->edit($data);
            if ($result == 1) {
                $this->success('修改管理员成功', 'admin/admin/list1');
            } else {
                $this->error($result);
            }

        }

        //get
        $adminInfo = model('Admin')->find(input('id'));

        if ($adminInfo) {
            $viewData = [
                'admins' => $adminInfo
            ];
            $this->assign($viewData);
        } else {
            return "<script>alert('查无此人')</script>";
        }


        return view();
    }

    //删除管理员
    public function del()
    {
        $admin = model('Admin')->find(input('post.id'));
        $result = $admin->delete();
        if ($result) {
            $this->success('删除成功', 'admin/admin/list1');
        } else {
            $this->error('删除失败');
        }
    }

    //启用 or 禁用
    public function status()
    {

        $data = [
            'status' => input('post.status'),
            'id' => input('post.id')
        ];
        if ($data['status']==0){
            $status= 1;
        }else{
            $status= 0;
        }

        $adminInfo = model('Admin')->find($data['id']);

        $adminInfo->status = $status;
        $result= $adminInfo->save();

        if ($result){

            if ($data['status']==0){
                $msg= '启用成功';
            }else{
                $msg= '禁用成功';
            }
            $this->success($msg,'admin/admin/list1');
        }else{

            if ($data['status']==0){
                $msg= '启用失败';
            }else{
                $msg= '禁用失败';
            }
            $this->error($msg);
        }
    }

    //升权 or 降权
    public function is_super()
    {

        $data = [
            'is_super' => input('post.is_super'),
            'id' => input('post.id')
        ];
        if ($data['is_super']==0){
            $is_super= 1;
        }else{
            $is_super= 0;
        }

        $adminInfo = model('Admin')->find($data['id']);

        $adminInfo->is_super = $is_super;
        $result= $adminInfo->save();

        if ($result){

            if ($data['is_super']==0){
                $msg= '提高权限成功';
            }else{
                $msg= '降低权限成功';
            }
            $this->success($msg,'admin/admin/list1');
        }else{

            if ($data['is_super']==0){
                $msg= '提高权限失败';
            }else{
                $msg= '降低权限失败';
            }
            $this->error($msg);
        }
    }

}
