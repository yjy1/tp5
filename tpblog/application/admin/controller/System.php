<?php

namespace app\admin\controller;

use think\Controller;

class System extends Base
{
    //系统设置
    public function set(){


        if (request()->isAjax()){
            //接收数据

            $data = [
                'id'=>input('post.id'),
                'webname' => input('post.webname'),
                'copyright' => input('post.copyright')
            ];

            //验证数据
            $result = model("System")->edit($data);
            if ($result == 1) {
                return $this->success("修改成功");
            } else {
                return $this->error($result);
            }
        }
        $webinfo= model('System')->find();
        $viewData= [
            'webinfo'=>$webinfo
        ];
        $this->assign($viewData);
        return view();
    }
}
