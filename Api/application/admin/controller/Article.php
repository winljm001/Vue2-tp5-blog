<?php
/**
 * 文章管理
 * @since   2018-08-22
 * @author  Mr li <winljm001@qq.com>
 */

namespace app\admin\controller;


use app\model\AdminArticle;
use app\util\ReturnCode;
use app\util\Tools;

class Article extends Base {
    /**
     * 新增文章
     * @return array
     * @author  winljm001 <winljm001@126.com>
     */
    public function add() {
        $postData = $this->request->post();
        $postData['updatetime'] = time();
        $res = AdminArticle::create($postData);
        if ($res === false) {
            return $this->buildFailed(ReturnCode::DB_SAVE_ERROR, '操作失败');
        } else {
            return $this->buildSuccess([]);
        }
    }

    /**
     * 获取文章列表
     * @return array
     * @throws \think\exception\DbException
     * @author  winljm001 <winljm001@126.com>
     */
    public function index() {

        $limit = $this->request->post('size', config('apiAdmin.ADMIN_LIST_DEFAULT'));
        $start = $this->request->post('page', 1);
        $keywords = $this->request->post('keywords', '');
        $type = $this->request->post('type', '');
        $status = $this->request->post('status', '');

        $where = [];
        if ($status === '1' || $status === '0') {
            $where['status'] = $status;
        }
        if ($type!='') {
            $where['type'] = $type;
        }
        
        if($keywords!=''){
            $where=array_merge($where,['id|title'=>['like', "%{$keywords}%"]]);
        }

        $listObj = (new AdminArticle())->where($where)->order('updateTime DESC')
            ->paginate($limit, false, ['page' => $start])->toArray();
        $listInfo = $listObj['data'];
        return $this->buildSuccess([
            'list'  => $listInfo,
            'count' => $listObj['total']
        ]);
    }

    /**
     * 删除文章
     * @return array
     * @author winljm001 <winljm001@126.com>
     */
    public function del() {
        $id = $this->request->post('id');
        if (!$id) {
            return $this->buildFailed(ReturnCode::EMPTY_PARAMS, '缺少必要参数');
        }
        AdminArticle::destroy($id);
        return $this->buildSuccess([]);
    }
}
