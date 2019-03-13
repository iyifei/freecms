<?php
/**
 * Class [HomePage]
 * 请描述类的功能
 * author minyifei
 * date 2019/2/24
 */

namespace FreeCMS\Admin\Pages\Index;


use FreeCMS\Admin\BaseAdminPage;
use FreeCMS\Common\Model\CmsArchivesModel;
use FreeCMS\Common\Model\CmsMemberModel;

class HomePage extends BaseAdminPage
{

    /**
     * 执行入口
     *
     * @param array $vars
     */
    function execute($vars = [])
    {
        $arcModel = new CmsArchivesModel();
        $data = [];
        //网站内容浏览总数
        $clickSql = 'select sum(click) as Total,sum(feedbackcount) as FCount from cms_archives';
        $row = $arcModel->findFirstBySql($clickSql);
        $data['viewClick']=$row['Total'];
        //评论总数
        $data['feedbackCount']=$row['FCount'];
        //网站文章数
        $data['totalCount'] = $arcModel->count();
        //最新会员
        $arcMem = new CmsMemberModel();
        $members = $arcMem->orderBy('id desc')->limit(8)->findAll();
        $data['members']=$members;
        $data['memberCount']=$arcMem->count();
        $totalSize = disk_total_space(SYS_PATH);
        $freeSize = disk_free_space(SYS_PATH);
        $data['totalSize']=byte_format($totalSize);
        $data['freeSize']=byte_format($freeSize);
        //日志目录大小
        $logPath = SYS_PATH.'/_runtime';
        $data['logPath']=$logPath;
        $data['logPathSize']= byte_format(directorySize($logPath));
        //上传目录大小
        $uploadPath = SYS_PATH.'/uploads';
        $data['uploadPath']=$uploadPath;
        $data['uploadPathSize']= byte_format(directorySize($uploadPath));
        //数据库存储空间
        $dbName = $arcModel->getDatabaseName();
        $sql = sprintf("SELECT sum(data_length + index_length) AS TotalSize FROM information_schema.tables WHERE table_schema = '%s'",$dbName);
        $mysqlRow = $arcModel->findFirstBySql($sql);
        $data['mysqlSize']=byte_format($mysqlRow['TotalSize']);
        $this->assign('data',$data);
        $this->display();
    }
}