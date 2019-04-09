<?php

namespace app\index\controller;


class Index extends Base
{
    //首页
    public function index()
    {
        $where = [];
        $catename = null;

        if (input('?id')) {
            $where = [
                'cate_id' => input('id'),
            ];
            $catename = model("Cate")->where('id', input('id'))->value('catename');

        }
        //查出所有文章
        $articles = model('Article')->where($where)->order('create_time', 'desc')->paginate(5);
        $viewData = [
            'articles' => $articles,
            'catename' => $catename
        ];
        $this->assign($viewData);
        return view();
    }

    //注册
    public function register()
    {
        if (request()->isAjax()) {
            $data = [
                'username' => input('post.username'),
                'password' => input('post.password'),
                'conpass' => input('post.conpass'),      //确认不能添加进数据库
                'nickname' => input('post.nickname'),
                'email' => input('post.email'),
                'verify' => input('post.verify'),

            ];

            //验证
            $result = model('Member')->register($data);

            if ($result == 1) {
                $this->success('注册成功', 'index/index/login');
            } else {
                $this->error($result);
            }
        }


        return view();
    }

    //登录
    public function login()
    {
        if (request()->isAjax()) {
            $data = [
                'username' => input('post.username'),
                'password' => input('post.password'),
                'verify' => input('post.verify'),
            ];

            //验证
            $result = model('Member')->login($data);
            if ($result == 1) {
                $this->success('登录成功', 'index/index/index');
            } else {
                $this->error($result);
            }
        }

        return view();
    }


    //退出
    public function logout()
    {

        session(null);
        if (session('index')) {
            $this->error('退出失败');
        }
        $this->success('退出成功', 'index/index/login');

    }

    //搜索
    public function search()
    {
        $where[] = ['title', 'like', '%' . input('keyword') . '%'];
        $catename = input('keyword');
        $articles = model('Article')->where($where)
            ->order('create_time', 'desc')->paginate(2);

        if (count($articles) != 0) {
            $viewData = [
                'articles' => $articles,
                'catename' => $catename
            ];
            $this->assign($viewData);

            return view('index');

        } else {

            return "<script>
            alert('无该文章');
            location.href= '/';
            </script>";

        }
    }

    //评论
    public function comment()
    {
        if (request()->isAjax()) {
            $data = [
                'article_id' => input('post.article_id'),
                'member_id' => input('post.member_id'),
                'content' => input('post.content'),
            ];

            //验证
            $result = model('Comment')->comment($data);
            if ($result == 1) {
                $this->success('评论成功');
            } else {
                $this->error($result);
            }
        }

        return view('info');
    }

}
