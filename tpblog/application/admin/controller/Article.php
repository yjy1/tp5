<?php

namespace app\admin\controller;

use think\Controller;

use think\facade\Request;

class Article extends Base
{
    //文章列表
    public function list1()
    {
        $articles = model('Article')->with('cate')->order(['is_top' => 'asc', 'create_time' => 'desc'])->paginate(5);
        $viewData = [
            'articles' => $articles
        ];
        $this->assign($viewData);

        return view();
    }

    //添加文章
    public function add()
    {
        if (request()->isAjax()) {
            $data = [
                'title' => input('post.title'),
                'desc' => input('post.desc'),
                'tags' => input('post.tags'),
                'content' => input('post.content'),
                'is_top' => input('post.is_top', '0'),
                'cate_id' => input('post.cate_id'),
            ];

            $result = model('Article')->add($data);

            if ($result == 1) {
                return $this->success("添加文章成功", 'admin/article/list1');
            } else {
                return $this->error($result);
            }
        }

//        查出所有栏目
        $cates = model('Cate')->select();
        $viewData = [
            'cates' => $cates
        ];

        $this->assign($viewData);

        return view();
    }

    //推荐和取消推荐
    public function top()
    {
        $data= [
            'id'=>input('post.id'),
            'is_top'=>input('post.is_top')
        ];

        if ($data['is_top']==0){
            $is_top= 1;
        }else{
            $is_top= 0;
        }
        $article= model('Article')->find($data['id']);

        $article->is_top= $is_top;

        $result= $article->save();
        if ($result){
            if ($data['is_top']==0){
                 $msg= '推荐成功';
            }else{
                 $msg= '取消推荐成功';
            }
            $this->success($msg,'admin/article/list1');
        }else{
            if ($data['is_top']==0){
                $msg= '推荐失败';
            }else{
                $msg= '取消推荐失败';
            }
            $this->error($msg);
        }

    }

    //文章编辑
    public function edit()
    {

        if (request()->isAjax()){
            $data= [
                'tags'=>input('post.tags'),
                'is_top'=>input('post.is_top'),
                'cate_id'=>input('post.cate_id'),
                'id'=>input('post.id')
            ];


            $result= model("Article")->edit($data);
            if ($result==1){
                $this->success('修改文章成功','admin/article/list1');
            }else{
              return $this->error($result);
            }
        }
        $articleInfo= model("Article")->find(input('id'));
        $cateInfo= model("Cate")->select();
        $viewData= [
            'article'=>$articleInfo,
            'cate'=>$cateInfo
        ];
        $this->assign($viewData);
        return view();
    }

    //删除文章
    public function del(){

        $articleInfo= model("Article")->with('comment')->find(input('post.id'));
        if ($articleInfo){
            $result= $articleInfo->together('comment')->delete();

            if ($result){
                $this->success('删除成功','admin/article/list1');
            }else{
                $this->error('删除失败');
            }
        }else{
            $this->error('未找到该文章');
        }
    }

}
