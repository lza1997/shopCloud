package com.lza.service;

import com.lza.entiry.Member;

public interface MemberService {

    /**
     * 根据会员id获取会员信息
     * @param memberId
     * @return
     */
    Member findById(Integer memberId);
}
