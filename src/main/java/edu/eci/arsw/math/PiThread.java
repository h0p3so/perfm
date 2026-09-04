package edu.eci.arsw.math;

public class PiThread extends Thread {

    private static final Object PAUSE_LOCK = new Object();
    private static final int CHUNK_SIZE = 500;
    private static final long PAUSE_INTERVAL_MS = 5000;

    private final int start;
    private final int count;
    private byte[] digits;
    private int processed;

    public PiThread(int start, int count) {
        this.start = start;
        this.count = count;
    }

    @Override
    public void run() {
        digits = new byte[count];
        int currentStart = start;
        int offset = 0;
        long lastCheck = System.currentTimeMillis();

        while (offset < count) {
            int chunk = Math.min(CHUNK_SIZE, count - offset);
            byte[] partial = PiDigits.getDigits(currentStart, chunk);
            System.arraycopy(partial, 0, digits, offset, chunk);

            offset += chunk;
            currentStart += chunk;
            processed += chunk;

            if (System.currentTimeMillis() - lastCheck >= PAUSE_INTERVAL_MS) {
                System.out.println(getName() + " ha procesado " + processed + " digitos. Presione Enter para continuar...");
                synchronized (PAUSE_LOCK) {
                    try {
                        PAUSE_LOCK.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                        return;
                    }
                }
                lastCheck = System.currentTimeMillis();
            }
        }
    }

    /**
     * Wakes up every PiThread currently paused waiting for Enter to be pressed.
     */
    public static void resumeAll() {
        synchronized (PAUSE_LOCK) {
            PAUSE_LOCK.notifyAll();
        }
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
