package com.lza.service.Impl;

import com.lza.dao.MemberDao;
import com.lza.entiry.Member;
import com.lza.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDao memberDao;
    /**
     * 根据会员id获取会员信息
     * @param memberId
     * @return
     */
    @Override
    public Member findById(Integer memberId) {

        return memberDao.findById(memberId);
    }
}
