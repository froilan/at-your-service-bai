
import com.aysb.Employee;
import com.aysb.Employer;
import com.aysb.SiteUser;
import com.aysb.SiteRole;
import com.aysb.SiteUserSiteRole;
class BootStrap {

    def init = { servletContext ->
		SiteRole roleEmployee = SiteRole.findByAuthority("ROLE_EMPLOYEE") ? 
			SiteRole.findByAuthority("ROLE_EMPLOYEE") : new SiteRole(authority:"ROLE_EMPLOYEE").save(flush:true);
		SiteRole roleEmployer = SiteRole.findByAuthority("ROLE_EMPLOYER") ? 
			SiteRole.findByAuthority("ROLE_EMPLOYER") : new SiteRole(authority:"ROLE_EMPLOYER").save(flush:true);
    }
    def destroy = {
    }
}
