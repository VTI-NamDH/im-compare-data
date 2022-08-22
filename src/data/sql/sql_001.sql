-- [GET] /v1/projects/affiliate/{projectId}/conversions
-- 成果報酬案件の成果一覧取得


-- APIに関連する各テーブルにデータを投入するSQLクエリ
-- INSERT endclient TABLE
INSERT INTO `demo.mall`.`endclient` (`endclient_id`, `auth_id`, `is_terms`, `email`, `name`, `company_name`, `tel`, `is_active`, `created_at`, `updated_at`)
    VALUES ('1199b0d4-3dd7-11eb-b2d6-06bd2aecl001', '5fd7088c00625e00685b46b8', 0, 'sample@email.com', '桃太郎', '株式会社サンプル名', '0393021039', 1, '2020-06-10 11:57:05', '2020-06-10 11:57:05');

-- INSERT m_project
INSERT INTO `demo.mall`.`m_project` (`m_project_id`, `endclient_id`, `status`, `title`, `m_project_type_id`, `recruit_type`, `m_write_type_id`, `incentive_id`, `incentive_item_type`, `price`, `sns_id`, `follower_count_id`, `m_experience_id`, `img_name_1`, `img_name_2`, `content`, `recruit_count`, `recruit_date_start`, `recruit_date_end`, `assign_date`, `target_sex`, `target_age_min`, `target_age_max`, `memo`, `created_at`, `updated_at`, `is_active` )
    VALUES ('00454d4a-b2c9-11eb-9fd6-06d367mpj001', '1199b0d4-3dd7-11eb-b2d6-06bd2aecl001', 2, 'プロジェクト名：テストタイトル指定００１', 5, 1, 3, 1, 2, 1500, 1, 1, 2, 'https://im-mall-post.s3.us-west-2.amazonaws.com/insite/thumb-mqQHktVc12c66JVjczqcFhEZfO9Zne2AYtDRAyrb.jpeg', 'https://im-mall-post.s3.us-west-2.amazonaws.com/insite/FQkTDFIgvecgxLs4m9U8scfDq8tbybpfxIYwqwlQ.jpeg', '商品の紹介です。', 11, '2022-01-27 00:00:00', '2022-02-21 00:00:00', '2022-02-24 00:00:00', 1, 18, 70, '連絡事項・注意項目を記載', '2022-01-13 17:43:16', '2022-01-27 13:19:37', 0);


-- INSERT affiliate
INSERT INTO `demo.mall`.`affiliate` (`m_project_id`, `price`, `condition`, `accept`, `cv_rate`, `accept_rate`, `landing_url`, `reject_condition`, `created_at`, `updated_at`)
    VALUES ('00454d4a-b2c9-11eb-9fd6-06d367mpj001', '2100', '弊社指定サイトでの【500円モニター獲得】', '手動承認 ※承認頻度：随時', '25', '95.00', 'https://cocoro-dining.co.jp/ninjinashitaba-lp04a/', '不備・不正・重複・いたずら・キャンセル・その他お申込み内容に不備がある場合', '2022-03-15 18:01:41', '2022-03-15 18:16:03');

-- INSERT influencer
INSERT INTO `demo.mall`.`influencer` (`influencer_id`, `auth_id`, `is_active`, `sns_status`, `email`, `address_flag`, `bank_flag`, `audit_status`, `prefecture`, `notice_flag`, `is_planb`, `is_terms`, `created_at`, `updated_at`)
    VALUES
        ('05c185b8-8ab1-11ea-99d6-06ac53inf001', '5eaa78cd6b69bc0c12e53032', '1', '3', 'demo@castme.com', '1', '1', '2', '11', '1', '0', '0', '2022-04-30 16:05:49', '2022-07-13 11:36:34'),
        ('05c185b8-8ab1-11ea-99d6-06ac53inf002', '5eaa78cd6b69bc0c12e53033', '1', '3', 'demo@castme.com', '1', '1', '2', '11', '1', '0', '0', '2022-04-30 16:05:49', '2022-07-13 11:36:34'),
        ('05c185b8-8ab1-11ea-99d6-06ac53inf003', '5eaa78cd6b69bc0c12e53034', '1', '3', 'demo@castme.com', '1', '1', '2', '11', '1', '0', '0', '2022-04-30 16:05:49', '2022-07-13 11:36:34');

-- INSERT influencer_socialmedia
INSERT INTO `demo.mall`.`influencer_socialmedia` (`influencer_id`, `media_id`, `socialmedia_id`, `created_at`, `updated_at`, `is_active`, `pr_rate`, `avg_comment_count`, `recent_comment_max`, `recent_comment_min`, `recent_like_max`, `recent_like_min`, `age_man_rate_1`, `age_man_rate_2`, `age_man_rate_3`, `age_man_rate_4`, `age_man_rate_5`, `age_man_rate_6`, `age_women_rate_1`, `age_women_rate_2`, `age_women_rate_3`, `age_women_rate_4`, `age_women_rate_5`, `age_women_rate_6`, `is_update`)
    VALUES
        ('05c185b8-8ab1-11ea-99d6-06ac53inf001', 'media_momotaro', '1', '2020-05-29 15:15:14', '2021-06-22 19:33:57', '1', '12.00', '45', '83', '19', '5083', '2623', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
        ('05c185b8-8ab1-11ea-99d6-06ac53inf002', 'okinawa_travel', '1', '2020-05-29 15:15:14', '2021-06-22 19:33:57', '1', '65.00', '34', '83', '19', '5083', '2623', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
        ('05c185b8-8ab1-11ea-99d6-06ac53inf003', 'osaka_travel', '1', '2020-05-29 15:15:14', '2021-06-22 19:33:57', '1', '45.00', '23', '83', '19', '5083', '2623', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

--「affiliate_conversion」テーブルにメインテストデータを投入するSQLクエリ
-- INSERT influencer_socialmedia
INSERT INTO `demo.mall`.`affiliate_conversion` (`m_project_id`, `influencer_id`, `endclient_id`, `order_id`, `conversion_at`, `approve_status`, `created_at`, `updated_at`, `click_at`, `useragent`, `os`, `referer_url`, `current_url`, `memo` )
    VALUES
        ( '00454d4a-b2c9-11eb-9fd6-06d367mpj001' , '05c185b8-8ab1-11ea-99d6-06ac53inf001', '1199b0d4-3dd7-11eb-b2d6-06bd2aecl001', 'order_id_001' , '2022-05-27 16:00:00', 1, '2022-05-27 15:59:50', '2022-05-27 15:59:50', '2022-05-27 15:59:50','ss','window or mac', 'sample.url.com', 'sample.url.com', 'test memo' ),

        ( '00454d4a-b2c9-11eb-9fd6-06d367mpj001' , '05c185b8-8ab1-11ea-99d6-06ac53inf002', '1199b0d4-3dd7-11eb-b2d6-06bd2aecl001', 'order_id_002' , '2022-05-27 16:00:00', 1, '2022-05-27 15:59:50', '2022-05-27 15:59:50', '2022-05-27 15:59:50','ss','window or mac', 'sample.url.com', 'sample.url.com', 'test memo' ),

        ( '00454d4a-b2c9-11eb-9fd6-06d367mpj001' , '05c185b8-8ab1-11ea-99d6-06ac53inf003', '1199b0d4-3dd7-11eb-b2d6-06bd2aecl001', 'order_id_003' , '2022-05-27 16:00:00', 1, '2022-05-27 15:59:50', '2022-05-27 15:59:50', '2022-05-27 15:59:50','ss','window or mac', 'sample.url.com', 'sample.url.com', 'test memo' );