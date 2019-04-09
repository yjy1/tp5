<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------


//前台路由
Route::rule('cate/:id','index/index/index','get');
Route::rule('/','index/index/index','get');
Route::rule('article-<id>','index/article/info','get');
Route::rule('register','index/index/register','get|post');
Route::rule('login','index/index/login','get|post');
Route::rule('logout','index/index/logout','get|post');
Route::rule('search','index/index/search','get');
Route::rule('comment','index/index/comment','get|post');
Route::rule('article_push','index/article/push','get|post');

//后台路由
Route::group('admin',function (){
    //登录
    Route::rule('test','admin/index/test','get|post');  //测试
    Route::rule('/','admin/index/login','get|post');
    Route::rule('a','admin/index/a','get|post');    //测试
    Route::rule('forget','admin/index/forget','get|post');
    Route::rule('index','admin/home/index','get|post');
    Route::rule('logout','admin/home/logout','get|post');
    //栏目
    Route::rule('cate','admin/cate/list1','get|post');
    Route::rule('cateadd','admin/cate/add','get|post');
    Route::rule('catesort','admin/cate/sort','get|post');
    Route::rule('cateedit/[:id]','admin/cate/edit','get|post');
    Route::rule('catedelete','admin/cate/delete','get|post');   //删除
    Route::rule('catede_change_sort','admin/cate/change_sort','get|post');

    //文章
    Route::rule('articlelist','admin/article/list1','get');
    Route::rule('articleadd','admin/article/add','get|post');
    Route::rule('articletop','admin/article/top','get|post');
    Route::rule('articleedit/[:id]','admin/article/edit','get|post'); //编辑
    Route::rule('articledel','admin/article/del','get|post');



    //会员
    Route::rule('memberlist','admin/member/list1','get|post');
    Route::rule('memberadd','admin/member/add','get|post');
    Route::rule('memberedit/[:id]','admin/member/edit','get|post');
    Route::rule('memberdel','admin/member/del','get|post');


    //管理员
    Route::rule('adminlist','admin/admin/list1','get|post');
    Route::rule('adminadd','admin/admin/add','get|post');
    Route::rule('adminedit/[:id]','admin/admin/edit','get|post');
    Route::rule('admindel','admin/admin/del','get|post');
    Route::rule('adminstatus','admin/admin/status','get|post');
    Route::rule('adminsuper','admin/admin/is_super','get|post');


    //评论
    Route::rule('commentlist','admin/comment/list1','get|post');
    Route::rule('commentadd','admin/comment/add','get|post');
    Route::rule('commentedit/[:id]','admin/comment/edit','get|post');
    Route::rule('commentdel','admin/comment/del','get|post');


    //系统设置
    Route::rule('set','admin/system/set','get|post');


});




