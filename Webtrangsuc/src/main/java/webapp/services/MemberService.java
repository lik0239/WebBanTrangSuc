package webapp.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import webapp.models.Member;
import webapp.models.MemberRepository;

@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;

    public void register(String username, String password) {
        Member member = new Member();
        member.setUsername(username);
        member.setPassword(password);
        member.setEnabled(true);
        memberRepository.save(member);
    }
}


