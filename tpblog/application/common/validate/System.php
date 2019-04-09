<?php


namespace app\common\validate;


use think\Validate;

class System extends Validate
{
    //规则
    protected $rule= [
        'webname|网站名称'=> 'require',
        'copyright|版权信息'=>'require'
    ];

    //修改网站信息场景
    public function sceneEdit(){
        return $this->only(['webname','copyright']);
    }

}