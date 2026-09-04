package edu.eci.arsw.math;

public class PiThread extends Thread {
    private final int start;
    private final int count;
    private byte[] digits;

    public PiThread(int start, int count) {
        this.start = start;
        this.count = count;
    }

    @Override
    public void run() {
        digits = PiDigits.getDigits(start, count);
    }

    public byte[] getDigits() {
        return digits;
    }

    public int getStart() {
        return start;
    }

    public int getCount() {
        return count;
    }
}
