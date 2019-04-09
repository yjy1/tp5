<?php

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;
use think\model\relation\HasMany;

class Article extends Model
{
    //软删除
    use SoftDelete;

    //关联评论
    public function comment(){
        return $this->hasMany('Comment','article_id','id');
    }

    //添加文章
    public function add($data)
    {
        $validate = new \app\common\validate\Article();
        if (!$validate->scene('add')->check($data)) {
            return $validate->getError();
        } else {
            $result = $this->allowField(true)->save($data);
            if ($result) {
                return 1;
            } else {
                return '添加失败';
            }
        }
    }

    //发布文章
    public function push($data)
    {
        $validate = new \app\common\validate\Article();
        if (!$validate->scene('push')->check($data)) {
            return $validate->getError();
        }

        else {
            $result = $this->allowField(true)->save($data);
            if ($result) {
                return 1;
            } else {
                return '发布失败';
            }
        }
    }

    //关联栏目表
    public function cate()
    {
        return $this->belongsTo('Cate', 'cate_id', 'id');
    }

    //编辑文章
    public function edit($data){

        $validate = new \app\common\validate\Article();
        if (!$validate->scene('edit')->check($data)) {
            return $validate->getError();
        }

        else{
            $articleInfo= $this->find($data['id']);
            if ($articleInfo){

                $is_top= $data['is_top']==null ? 0 : 1;
                $articleInfo->tags= $data['tags'];
                $articleInfo->is_top= $is_top;
                $articleInfo->cate_id= $data['cate_id'];
                $result= $articleInfo->save();


                if ($result){
                    return 1;
                }else{
                    return '修改文章失败';
                }

            }
        }
    }

}
