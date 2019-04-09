<?php

namespace app\index\controller;


class Article extends Base
{


    //文章详情页
    public function info()
    {
        //查出文章信息
        $articles = model("Article")->with('comment,comment.member')->find(input('id'));
        $viewData = [
            'articles' => $articles
        ];

        $this->assign($viewData);
        return view();
    }

    //投稿
    public function push(){

        if (request()->isAjax()) {
            $data = [
                'tags' => input('post.tags'),
                'cate_id' => input('post.cate'),
                'desc' => input('post.desc'),
                'title' => input('post.title'),
                'content' => input('post.content'),
                'author'=>session('index.nickname')
            ];



            $result = model('Article')->push($data);

            if ($result == 1) {
                return $this->success("发布文章成功", 'index/index/index');
            } else {
                return $this->error($result);
            }
        }

        return view();
    }

}
