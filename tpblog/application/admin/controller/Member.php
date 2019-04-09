<?php

namespace app\admin\controller;

use think\Controller;

class Member extends Base
{
    //会员列表
    public function list1()
    {

        //查出所有管理员
        $memberInfo = model('Member')->order('create_time', 'desc')->paginate(6);
        $viewData = [
            'members' => $memberInfo
        ];
        $this->assign($viewData);

        //get
        return view();
    }

    //会员添加
    public function add()
    {

        if (request()->isAjax()) {
            $data = [
                'username' => input('post.username'),
                'password' => input('post.password'),
                'conpass' => input('post.conpass'),      //不能添加进数据库
                'nickname' => input('post.nickname'),
                'email' => input('post.email')
            ];

            //验证
            $result = model('Member')->add($data);

            if ($result == 1) {
                $this->success('添加会员成功', 'admin/member/list1');
            } else {
                $this->error($result);
            }
        }
        //视图 get
        return view();
    }

    //编辑会员
    public function edit()
    {

        if (request()->isAjax()){
            $data= [
                'id'=>input('post.id'),
                'password'=>input('post.password'),
                'conpass'=>input('post.conpass'),
                'nickname'=>input('post.nickname'),
                'email'=>input('post.email')
            ];


            $result= model('Member')->edit($data);
            if ($result==1){
                $this->success('编辑会员成功','admin/member/list1');
            }else{
                $this->error($result);
            }

        }

        //get
        $memberInfo = model('Member')->find(input('id'));
        if ($memberInfo) {
            $viewData = [
                'members' => $memberInfo
            ];
            $this->assign($viewData);
        } else {
            return "<script>alert('查无此人')</script>";
        }


        return view();
    }

    //删除会员
    public function del(){
        $member= model('Member')->with('comments')->find(input('post.id'));
        $result= $member->together('comments')->delete();
        if ($result){
            $this->success('删除成功','admin/member/list1');
        }else{
            $this->error('删除失败');
        }
     }

}
