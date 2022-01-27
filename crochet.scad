tn=1.5;         // Épaisseur
d=5;            // Nombre de dents
ds=5;           // Taille d'une dent
l=3;            // Largeur du crochet
c=10;           // Hauteur du crochet

hauteur=8;      // Haureur de la pièce


module triangle(x){
    square([tn,ds]);
    translate([tn,0,0]) polygon([[0,0], [0,x-tn], [(x/2)-tn,(x/2)-tn]]);
}
module ds(nb, x=10)
    for(i = [0:1:nb-1]){
        translate([0,x*i,0]) triangle(x);
}

module pincette(d, ds){
    difference(){
        union(){
            translate([0,d*ds-tn,0]) square([ds,tn]);
            ds(d,ds);
            mirror([1,0,0]) translate([-ds,ds/2,0]) ds(d,ds);
        }
        translate([0,d*ds,0]) square([ds,ds/2]);
    }
}

module crochet(){
    //square([tn,ds*d]);
    translate([0,ds*d-tn,0]) square([l+tn,tn]);
    translate([l+tn,ds*d-c,0]) square([tn,c]);
}

linear_extrude(hauteur) {
    mirror([1,0,0]) crochet();
    pincette(d,ds);
}


// vim: ft=openscad tw=100 noet ts=4 sw=4
