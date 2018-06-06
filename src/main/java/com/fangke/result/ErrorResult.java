package com.fangke.result;

/**
 * @author by fk
 * @version <0.1>
 * @created on 2018-01-15.
 */
public class ErrorResult extends BaseResult {

    private Error error;

    public Error getError() {
        return error;
    }

    public void setError(Error error) {
        this.error = error;
    }

    public ErrorResult() {
        super(FAIL);
    }

    public ErrorResult(String code, String message) {
        this();
        this.error = new Error();
        this.error.setCode(code);
        this.error.setMessage(message);
    }

}
