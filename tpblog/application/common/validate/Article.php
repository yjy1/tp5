<?php


namespace app\common\validate;


use think\Validate;

class Article extends Validate
{
    protected $rule= [

        'tags|标签'=> 'require',
        'cate_id|所属栏目'=> 'require' ,
        'desc|概要'=> 'require','title|标题'=> 'require',
        'content|内容'=> 'require',
    ];

    //添加文章场景
    public function sceneAdd(){
        return $this->only([
            'title','desc','tags','content','is_top','cate_id'
        ]);
    }

    //发布文章场景
    public function scenePush(){
        return $this->only([
           'tags','cate_id','desc', 'content','title'
        ]);
    }

    //编辑文章场景
    public function sceneEdit(){
       return $this->only([
             'tags'
       ]);
    }

}