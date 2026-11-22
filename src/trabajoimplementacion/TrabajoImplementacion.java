package trabajoimplementacion;

import javax.swing.SwingUtilities;

public class TrabajoImplementacion {

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new Ventana().setVisible(true));
    }
}
