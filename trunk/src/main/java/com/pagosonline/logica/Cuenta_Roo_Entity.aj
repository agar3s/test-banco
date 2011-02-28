// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pagosonline.logica;

import com.pagosonline.logica.Cuenta;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Cuenta_Roo_Entity {
    
    declare @type: Cuenta: @Entity;
    
    @PersistenceContext
    transient EntityManager Cuenta.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Cuenta.id;
    
    @Version
    @Column(name = "version")
    private Integer Cuenta.version;
    
    public Long Cuenta.getId() {
        return this.id;
    }
    
    public void Cuenta.setId(Long id) {
        this.id = id;
    }
    
    public Integer Cuenta.getVersion() {
        return this.version;
    }
    
    public void Cuenta.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Cuenta.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Cuenta.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Cuenta attached = Cuenta.findCuenta(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Cuenta.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Cuenta Cuenta.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Cuenta merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Cuenta.entityManager() {
        EntityManager em = new Cuenta().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Cuenta.countCuentas() {
        return entityManager().createQuery("select count(o) from Cuenta o", Long.class).getSingleResult();
    }
    
    public static List<Cuenta> Cuenta.findAllCuentas() {
        return entityManager().createQuery("select o from Cuenta o", Cuenta.class).getResultList();
    }
    
    public static Cuenta Cuenta.findCuenta(Long id) {
        if (id == null) return null;
        return entityManager().find(Cuenta.class, id);
    }
    
    public static List<Cuenta> Cuenta.findCuentaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Cuenta o", Cuenta.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}