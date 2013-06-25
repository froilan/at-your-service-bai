import com.ays.Role;
class BootStrap {

    def init = { servletContext ->
		Role roleEmployee = Role.findByAuthority("ROLE_ADMIN") ? 
			Role.findByAuthority("ROLE_ADMIN") : new Role(authority:"ROLE_ADMIN").save(flush:true);
		Role roleEmployer = Role.findByAuthority("ROLE_SITE_USER") ? 
			Role.findByAuthority("ROLE_SITE_USER") : new Role(authority:"ROLE_SITE_USER").save(flush:true);
    }
    def destroy = {
    }
}
