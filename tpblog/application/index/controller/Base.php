<?php

namespace app\index\controller;

use think\Controller;

class Base extends Controller
{
    //使用共享视图
    public function initialize(){

        $cates= model('Cate')->order('sort','asc')->select();
        $webinfo= model('System')->find();
        $toparticle= model('Article')->where('is_top','1')->limit(12)->select();


        $viewData= [
            'cates'=>$cates,
            'webinfo'=>$webinfo,
            'toparticle'=>$toparticle
        ];


        $this->view->share($viewData);
    }
}
