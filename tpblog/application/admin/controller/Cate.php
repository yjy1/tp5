<?php

namespace app\admin\controller;


class Cate extends Base
{
    //栏目列表
    public function list1()
    {
        //查出栏目信息
        $cates = model("Cate")->order("sort", "asc")->paginate(4);
        //定义模板数据变量
        $viewData = [
            'cates' => $cates
        ];
        $this->assign($viewData);


        return view();
    }


    //添加栏目
    public function add()
    {

        if (request()->isAjax()) {
            //接收数据
            $data = [
                'catename' => input('post.catename'),
                'sort' => input('post.sort')
            ];

            //验证数据
            $result = model("Cate")->add($data);
            if ($result == 1) {
                return $this->success("添加成功", "admin/cate/list1");
            } else {
                return $this->error($result);
            }
        }
        return view();
    }



    //编辑栏目
    public function edit()
    {

        if (request()->isAjax()) {

            //接收
            $data = [
                'id' => input('post.id'),
                'new_sort' => input('post.new_sort')
            ];
            $cate= model('Cate')->find($data['id']);
            if ($cate){
                $cate->sort= $data['new_sort'];
                $result= $cate->save();
                if ($result){
                    $this->success('修改栏目成功','admin/cate/list1');
                }else{
                    $this->error('修改栏目失败');
                }
            }


        }

        //查出原栏目的信息
        $cateInfo = model('Cate')->find(input('id'));
        //模板变量
        $viewData = [
            'cateInfo' => $cateInfo
        ];
        $this->assign($viewData);
        return view();
    }

    //删除栏目
    public function delete()
    {

        $cateInfo = model('Cate')->find(input('post.id'));

        $result = $cateInfo->delete();
        if ($result) {
            $this->success('删除栏目成功！');
        } else {
            $this->error('删除失败');
        }

    }

}
