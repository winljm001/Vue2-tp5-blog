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

}
