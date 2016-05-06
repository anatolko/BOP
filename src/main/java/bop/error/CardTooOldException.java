package bop.error;

/**
 * Error when user trying delete or change old BOP card
 */
public class CardTooOldException extends Exception{
    public CardTooOldException() {
        super();
    }

    public CardTooOldException(String message) {
        super(message);
    }

    public CardTooOldException(String message, Throwable cause) {
        super(message, cause);
    }

    public CardTooOldException(Throwable cause) {
        super(cause);
    }
}
