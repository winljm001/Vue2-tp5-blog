<?php
/**
 * 文章标签管理
 * @since   2018-08-22
 * @author  Mr li <winljm001@qq.com>
 */

namespace app\admin\controller;


use app\model\AdminArticleType;
use app\util\ReturnCode;
use app\util\Tools;

class ArticleType extends Base {
    /**
     * 新增文章类型
     * @return array
     * @author  winljm001 <winljm001@126.com>
     */
    public function add() {
        $postData = $this->request->post();
        $res = AdminArticleType::create($postData);
        if ($res === false) {
            return $this->buildFailed(ReturnCode::DB_SAVE_ERROR, '操作失败');
        } else {
            return $this->buildSuccess([]);
        }
    }

    /**
     * 获取文章类型列表
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

        $listObj = (new AdminArticleType())->where($where)->order('id DESC')
            ->paginate($limit, false, ['page' => $start])->toArray();
        $listInfo = $listObj['data'];
        return $this->buildSuccess([
            'list'  => $listInfo,
            'count' => $listObj['total']
        ]);
    }

    /**
     * 删除文章类型
     * @return array
     * @author winljm001 <winljm001@126.com>
     */
    public function del() {
        $id = $this->request->post('id');
        if (!$id) {
            return $this->buildFailed(ReturnCode::EMPTY_PARAMS, '缺少必要参数');
        }
        AdminArticleType::destroy($id);
        return $this->buildSuccess([]);
    }

    /**
     * 获取文章类型
     * @return object
     * @author winljm001 <winljm001@126.com>
     */
    public function detail() {
        $id = $this->request->post('id');
        if (!$id) {
            return $this->buildFailed(ReturnCode::EMPTY_PARAMS, '缺少必要参数');
        }
        $data = AdminArticleType::get(['id' => $id]);
        return $this->buildSuccess([
            'articleTag'  => $data
        ]);
    }

    /**
     * 编辑文章类型
     * @author winljm001 <winljm001@126.com>
     * @return array
     * @throws \think\exception\DbException
     */
    public function edit() {
        $postData = $this->request->post();
        $res = AdminArticleType::update($postData);
        if ($res === false) {
            return $this->buildFailed(ReturnCode::DB_SAVE_ERROR, '操作失败');
        } else {
            return $this->buildSuccess([]);
        }
    }
}
