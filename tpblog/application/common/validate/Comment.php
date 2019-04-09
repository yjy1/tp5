<?php


namespace app\common\validate;


use think\Validate;

class comment extends Validate
{
    protected $rule= [

        'article_id|被评论文章id' => 'require|number',
        'member_id|评论者id' => 'require|number' ,
        'content|评论内容' => 'require',
    ];

    //添加评论场景
    public function sceneAdd(){
        return $this->only([
             'article_id', 'member_id','content'
        ]);
    }

    //编辑评论场景
    public function sceneEdit(){
        return $this->only([
            'content' ,'article_id', 'member_id'
        ]);
    }

    //前台评论场景
    public function sceneComment(){
        return $this->only([
            'article_id', 'member_id','content'
        ]);
    }

}