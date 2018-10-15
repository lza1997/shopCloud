package com.lza.dao;

import com.lza.entiry.Member;

public interface MemberDao {

    Member findById(Integer memberId);
}
