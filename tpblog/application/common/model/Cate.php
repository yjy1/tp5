<?php

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

class Cate extends Model
{
    //软删除
    use SoftDelete;


    //添加栏目校验
    public function add($data){

        //实例化validate对象
        $validate= new \app\common\validate\Cate();
        if (!$validate->scene("add")->check($data)){
            //校验错误的话,返回错误信息
            return $validate->getError();
        }else{

          $result= $this->allowField(true)->save($data);
            if ($result){
                return 1;
            }else{
                return "栏目添加失败";
            }
        }
    }

    //栏目排序
    public function sort($data){
        $validate= new \app\common\validate\Cate();
        if (!$validate->scene('sort')->check($data)){
            return $validate->getError();
        }
        $cateInfo= $this->find($data['id']);
        $cateInfo->sort = $data['sort'];
        $result= $this->save();

        if ($result){
            return 1;
        }else{
            return '排序失败';
        }

    }

    //栏目编辑
    public function edit($data){
        $validate= new \app\common\validate\Cate();
        if (!$validate->scene('edit')->check($data)){
            return $validate->getError();
        }else{
            //修改数据库
            //先查询后修改
            $cateInfo= $this->find($data['id']);
            $cateInfo->catename= $data['catename'];
            $cateInfo->sort= $data['sort'];
            $result= $cateInfo->save();

            if ($result){
                return 1;
            }else{
                return "编辑栏目失败";
            }


        }
    }

    //关联文章
    public function article(){
        $this->hasMany('Article','cate_id','id');
    }

}
