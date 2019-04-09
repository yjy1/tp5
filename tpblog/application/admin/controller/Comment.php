<?php

namespace app\admin\controller;

use think\Controller;

class Comment extends Base
{
    //评论列表
    public function list1()
    {
        $comments = model('Comment')->with('member,article')->order( 'create_time','desc')->paginate(6);
        $viewData = [
            'comments' => $comments
        ];
        $this->assign($viewData);

        return view();
    }

    //添加评论
    public function add()
    {
        if (request()->isAjax()) {
            $data = [
                'content' => input('post.content'),
                'article_id' => input('post.article_id'),
                'member_id' => input('post.member_id')
            ];

            $result = model('Comment')->add($data);

            if ($result == 1) {
                return $this->success("添加文章成功", 'admin/comment/list1');
            } else {
                return $this->error($result);
            }
        }

////        查出所有栏目
//        $cates = model('Cate')->select();
//        $viewData = [
//            'cates' => $cates
//        ];
//
//        $this->assign($viewData);

        return view();
    }



    //编辑评论
    public function edit()
    {

        if (request()->isAjax()){
            $data= [
                'tags'=>input('post.tags'),
                'is_top'=>input('post.is_top','0')
            ];

            $result= model("Article")->edit($data);
            if ($result==1){
                $this->success('修改文章成功','admin/article/list1');
            }else{
                return $this->error($result);
            }
        }

        //get请求
        $commentInfo= model("Comment")->find(input('id'));

        $viewData= [
            'comments'=>$commentInfo,

        ];
        $this->assign($viewData);
        return view();
    }

    //删除评论
    public function del(){

        $commentInfo= model("Comment")->find(input('post.id'));
        if ($commentInfo){
            $result= $commentInfo->delete();

            if ($result){
                $this->success('删除成功','admin/comment/list1');
            }else{
                $this->error('删除失败');
            }
        }else{
            $this->error('未找到该评论');
        }
    }
}
