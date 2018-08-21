<?php
/**
 * 用户管理
 * @since   2018-08-17
 * @author  Mr li <winljm001@qq.com>
 */

namespace app\admin\controller;


use app\model\AdminUser;
use app\model\AdminUserData;
use app\util\ReturnCode;
use app\util\Tools;

class Admin extends Base {

    /**
     * 获取admin信息
     * @return array
     * @throws \think\exception\DbException
     * @author Mr li <winljm001@qq.com>
     */
    public function getAdmin() {
        $id = $this->request->post('uid');
        if (!$id) {
            return $this->buildFailed(ReturnCode::EMPTY_PARAMS, '缺少必要参数');
        }
        $where['a.id'] = $id;
        $data=(new AdminUser())->alias('a')
        ->join('blog_admin_user_data e','a.id = e.uid')
        ->field('a.*,e.*')
        ->where($where)->find();
        unset($data['password']);
        // var_dump($data);
        return $this->buildSuccess([
            'admin'  => $data
        ]);
    }

    /**
     * 编辑admin信息
     * @author winljm001 <winljm001@126.com>
     * @return array
     * @throws \think\exception\DbException
     */
    public function setAdmin() {
        $postData = $this->request->post();
        $admin1Data['id'] = $postData['id'];
        $admin1Data['username'] = $postData['username'];
        $admin1Data['nickname'] = $postData['nickname'];
        if(isset($postData['password'])){
            $admin1Data['password'] = Tools::userMd5($postData['password']);
        }
        $res = AdminUser::update($admin1Data);
        $admin2Data['headImg'] = $postData['headImg'];
        $admin2Data['email'] = $postData['email'];
        $admin2Data['technology'] = $postData['technology'];
        $admin2Data['reference'] = $postData['reference'];
        $admin2Data['logo'] = $postData['logo'];
        AdminUserData::where(['uid' => $admin1Data['id']])->update($admin2Data);
        if ($res === false) {
            return $this->buildFailed(ReturnCode::DB_SAVE_ERROR, '操作失败');
        } else {
            return $this->buildSuccess([]);
        }
    }

}
