<?php


namespace app\common\validate;


use think\Validate;

class Cate extends Validate
{
    //规则
    protected $rule= [
        'catename|栏目名称'=> 'require|unique:cate',
        'sort|排序'=>'require|number'
    ];

    //添加
    public function sceneAdd(){
        return $this->only(['catename','sort']);
    }

    //排序场景
    public function sceneSort(){
        return $this->only(['sort']);
    }

    //编辑
    public function sceneEdit(){
        return $this->only(['sort']);
    }

}