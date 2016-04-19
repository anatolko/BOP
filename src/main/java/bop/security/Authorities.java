package bop.security;

/**
 * Constants for Spring Security authorities.
 */
public enum  Authorities {
    ADMIN("ROLE_ADMIN"),
    MODERATOR("ROLE_MODERATOR"),
    USER("ROLE_USER"),
    ANONYMOUS("ROLE_ANONYMOUS");

    private final String role;

    private Authorities(String role) {
        this.role = role;
    }

    public boolean equalsRole(String otherRole) {
        return (otherRole == null) ? false : role.equals(otherRole);
    }

    public String toString() {
        return role;
    }
}
