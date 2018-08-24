<?php
/**
 * 文章标签管理
 * @since   2018-08-22
 * @author  Mr li <winljm001@qq.com>
 */

namespace app\admin\controller;


use app\model\AdminArticleTag;
use app\util\ReturnCode;
use app\util\Tools;

class ArticleTag extends Base {
    /**
     * 新增文章标签
     * @return array
     * @author  winljm001 <winljm001@126.com>
     */
    public function add() {
        $postData = $this->request->post();
        $res = AdminArticleTag::create($postData);
        if ($res === false) {
            return $this->buildFailed(ReturnCode::DB_SAVE_ERROR, '操作失败');
        } else {
            return $this->buildSuccess([]);
        }
    }

    /**
     * 获取文章标签列表
     * @return array
     * @throws \think\exception\DbException
     * @author  winljm001 <winljm001@126.com>
     */
    public function index() {

        $limit = $this->request->post('size', config('apiAdmin.ADMIN_LIST_DEFAULT'));
        $start = $this->request->post('page', 1);
        $keywords = $this->request->post('keywords', '');

        $where = [];
        
        if($keywords!=''){
            $where=array_merge($where,['id|name'=>['like', "%{$keywords}%"]]);
        }

        $listObj = (new AdminArticleTag())->where($where)->order('id DESC')
            ->paginate($limit, false, ['page' => $start])->toArray();
        $listInfo = $listObj['data'];
        return $this->buildSuccess([
            'list'  => $listInfo,
            'count' => $listObj['total']
        ]);
    }

    /**
     * 删除文章标签
     * @return array
     * @author winljm001 <winljm001@126.com>
     */
    public function del() {
        $id = $this->request->post('id');
        if (!$id) {
            return $this->buildFailed(ReturnCode::EMPTY_PARAMS, '缺少必要参数');
        }
        AdminArticleTag::destroy($id);
        return $this->buildSuccess([]);
    }

    /**
     * 获取文章标签
     * @return object
     * @author winljm001 <winljm001@126.com>
     */
    public function detail() {
        $id = $this->request->post('id');
        if (!$id) {
            return $this->buildFailed(ReturnCode::EMPTY_PARAMS, '缺少必要参数');
        }
        $data = AdminArticleTag::get(['id' => $id]);
        return $this->buildSuccess([
            'articleTag'  => $data
        ]);
    }

    /**
     * 编辑文章标签
     * @author winljm001 <winljm001@126.com>
     * @return array
     * @throws \think\exception\DbException
     */
    public function edit() {
        $postData = $this->request->post();
        $res = AdminArticleTag::update($postData);
        if ($res === false) {
            return $this->buildFailed(ReturnCode::DB_SAVE_ERROR, '操作失败');
        } else {
            return $this->buildSuccess([]);
        }
    }
}
