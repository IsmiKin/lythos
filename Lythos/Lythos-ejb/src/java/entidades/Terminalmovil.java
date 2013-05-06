/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author IsmiKinPorti
 */
@Entity
@Table(name = "terminalmovil")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Terminalmovil.findAll", query = "SELECT t FROM Terminalmovil t"),
    @NamedQuery(name = "Terminalmovil.findByIdTerminalMovil", query = "SELECT t FROM Terminalmovil t WHERE t.idTerminalMovil = :idTerminalMovil"),
    @NamedQuery(name = "Terminalmovil.findByCodigo", query = "SELECT t FROM Terminalmovil t WHERE t.codigo = :codigo")})
public class Terminalmovil implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    @NotNull
    @Column(name = "idTerminalMovil")
    private Integer idTerminalMovil;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "Codigo")
    private String codigo;
    @JoinColumn(name = "Usuario_idUsuario", referencedColumnName = "idUsuario")
    @ManyToOne
    private Usuario usuarioidUsuario;
    @JoinColumn(name = "ModeloMovil_idModeloMovil", referencedColumnName = "idModeloMovil")
    @ManyToOne
    private Modelomovil modeloMovilidModeloMovil;
    @JoinColumn(name = "Linea_idLinea", referencedColumnName = "idLinea")
    @ManyToOne
    private Linea lineaidLinea;

    public Terminalmovil() {
    }

    public Terminalmovil(Integer idTerminalMovil) {
        this.idTerminalMovil = idTerminalMovil;
    }

    public Terminalmovil(Integer idTerminalMovil, String codigo) {
        this.idTerminalMovil = idTerminalMovil;
        this.codigo = codigo;
    }

    public Integer getIdTerminalMovil() {
        return idTerminalMovil;
    }

    public void setIdTerminalMovil(Integer idTerminalMovil) {
        this.idTerminalMovil = idTerminalMovil;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Usuario getUsuarioidUsuario() {
        return usuarioidUsuario;
    }

    public void setUsuarioidUsuario(Usuario usuarioidUsuario) {
        this.usuarioidUsuario = usuarioidUsuario;
    }

    public Modelomovil getModeloMovilidModeloMovil() {
        return modeloMovilidModeloMovil;
    }

    public void setModeloMovilidModeloMovil(Modelomovil modeloMovilidModeloMovil) {
        this.modeloMovilidModeloMovil = modeloMovilidModeloMovil;
    }

    public Linea getLineaidLinea() {
        return lineaidLinea;
    }

    public void setLineaidLinea(Linea lineaidLinea) {
        this.lineaidLinea = lineaidLinea;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTerminalMovil != null ? idTerminalMovil.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Terminalmovil)) {
            return false;
        }
        Terminalmovil other = (Terminalmovil) object;
        if ((this.idTerminalMovil == null && other.idTerminalMovil != null) || (this.idTerminalMovil != null && !this.idTerminalMovil.equals(other.idTerminalMovil))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Terminalmovil[ idTerminalMovil=" + idTerminalMovil + " ]";
    }
    
}
